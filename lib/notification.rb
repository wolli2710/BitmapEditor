module Notification

  @@registrants = []

  def show_error(message)
    error_message = "Error: " + message
    puts error_message
    error_notification
    error_message
  end

  def show_message(message)
    notification_message = "Notification: " + message
    puts notification_message
    notification_message
  end

  def register_notifications(registrant)
    @@registrants << registrant
  end

  def error_notification
    @@registrants.each do |registrant|
      registrant.error_update
    end
  end

end