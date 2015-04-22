require_relative 'bitmap_editor'
require_relative 'notification'
require_relative 'user_input'

class InputManager
  
  include Notification
  include UserInput

  attr_reader :session_commands

  @@running = true

  def initialize
    @session_commands = []
    @bitmap_editor = BitmapEditor.new
    register_notifications(self)
  end

  def run
    while @@running do
      user_input = STDIN.gets.chomp
      update_session_commands(user_input)
      handle_user_input user_input
    end
    show_message("Session ended")
  end

  def update_session_commands(cmd)
    @session_commands << cmd
  end

  def print_session_commands
    @session_commands.map{|cmd| puts cmd }
  end

  def error_update
    @session_commands.pop
  end

end