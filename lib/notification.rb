module Notification
  def show_error(message)
    error_message = "Error: " + message
    puts error_message
    error_message
  end

  def show_message(message)
    notification_message = "Notification: " + message
    puts notification_message
    notification_message
  end
end