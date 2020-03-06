# frozen_string_literal: true

class FavouritesController < ApplicationController
  before_action :set_favourite, only: %i[show edit update destroy]

  # GET /favourites
  # GET /favourites.json
  def index
    @favourites = Favourite.all
  end

  # GET /favourites/1
  # GET /favourites/1.json
  def show; end

  # GET /favourites/new
  def new
    @favourite = Favourite.new
  end

  # GET /favourites/1/edit
  def edit; end

  # POST /favourites
  # POST /favourites.json
  def create
    check_favourite = Search::Favourite.check_if_already_favourite(params[:show_id].to_i, current_user.id)
    if check_favourite
      flash[:notice] = 'Favourite already Created.'
      redirect_to root_path
    else
      @favourite = Favourite.new(show_id: favourite_params)
      @favourite.user_id = current_user.id
      show_detail = ShowService.get_show_and_channel_detail(@favourite.show_id)
      respond_to do |format|
        if @favourite.save
          FavouriteMailer.delay(run_at: show_detail[:show_time].to_time - 30.minutes).send_reminder(current_user.email, show_detail)
          format.html { redirect_to root_path, notice: 'Favourite was successfully created.' }
          format.json { render :show, status: :created, location: @favourite }
        else
          format.html { render :new }
          format.json { render json: @favourite.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /favourites/1
  # PATCH/PUT /favourites/1.json
  def update
    respond_to do |format|
      if @favourite.update(favourite_params)
        format.html { redirect_to @favourite, notice: 'Favourite was successfully updated.' }
        format.json { render :show, status: :ok, location: @favourite }
      else
        format.html { render :edit }
        format.json { render json: @favourite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favourites/1
  # DELETE /favourites/1.json
  def destroy
    @favourite.destroy
    respond_to do |format|
      format.html { redirect_to favourites_url, notice: 'Favourite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_favourite
    @favourite = Favourite.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def favourite_params
    params[:show_id]
  end
end
