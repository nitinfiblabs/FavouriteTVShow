# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'nitin@fiblabs.com'
  layout 'mailer'
end
