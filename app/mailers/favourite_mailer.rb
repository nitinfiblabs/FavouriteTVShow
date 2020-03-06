# frozen_string_literal: true

class FavouriteMailer < ApplicationMailer
  def send_reminder(to_email, show_detail)
    binding.pry
    @show_name = show_detail[:show_name],
                 @channel_name = show_detail[:channel_name],
                 @show_time = show_detail[:show_time].to_time.strftime('%m/%d/%Y %I:%M%p')

    mail(to: to_email, subject: 'Show Reminder')
  end
end
