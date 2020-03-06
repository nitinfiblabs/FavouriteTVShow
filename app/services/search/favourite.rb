# frozen_string_literal: true

class Search::Favourite
  # Check if the show is already in the favourite list
  def self.check_if_already_favourite(show_id, user_id)
    Favourite.find_by(show_id: show_id, user_id: user_id).present?
  end
end
