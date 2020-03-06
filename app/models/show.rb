# frozen_string_literal: true

class Show < ApplicationRecord
  belongs_to :channel
  has_many :favourite_mappings, class_name: :Favourite, foreign_key: :show_id
  has_many :favouritees, through: :favourite_mappings, source: :user
end
