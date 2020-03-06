# frozen_string_literal: true

class Search::Show
  def self.get_show_details(data)
    Show.joins(:channel).where(['channels.name LIKE ? or shows.name LIKE ?', "%#{data[:search]}%", "%#{data[:search]}%"])
  end
end
