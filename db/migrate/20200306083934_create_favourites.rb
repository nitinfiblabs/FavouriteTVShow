# frozen_string_literal: true

class CreateFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites do |t|
      t.references :show
      t.references :user
      t.timestamps
    end
  end
end
