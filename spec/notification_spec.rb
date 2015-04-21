require_relative '../lib/notification'

describe Notification do 
  include Notification

  it "should return error message" do
    message = "has error"
    expect(show_error(message)).to match("Error: " + message)
  end
  
  it "should return notification message" do
    message = "Session ended"
    expect(show_message(message)).to match("Notification: " + message)
  end
end