# frozen_string_literal: true

class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.string :timing
      t.references :channel

      t.timestamps
    end
  end
end
