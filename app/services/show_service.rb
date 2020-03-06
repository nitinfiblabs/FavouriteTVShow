# frozen_string_literal: true

class ShowService
  def self.get_show_and_channel_detail(show_id)
    show_detail = Show.joins(:channel).where(id: show_id).first
    {
      show_name: show_detail.name,
      channel_name: show_detail.channel.name,
      show_time: show_detail.timing
    }
  end
end
