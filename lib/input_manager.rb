require_relative 'bitmap_editor'
require_relative 'notification'
require_relative 'user_input'

class InputManager
  
  include Notification
  include UserInput

  @@running = true

  def initialize
    @bitmap_editor = BitmapEditor.new
  end

  def run
    while @@running do
      user_input = STDIN.gets.chomp
      handle_user_input user_input
    end
    show_message("Session ended")
  end

end