# frozen_string_literal: true

json.extract! show, :id, :created_at, :updated_at
json.url show_url(show, format: :json)
