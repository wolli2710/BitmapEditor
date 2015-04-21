require_relative 'bitmap_editor'
require_relative 'notification'

class InputManager
  include Notification
  @@running = true
  @user_input 

  def initialize
    @bitmap_editor = BitmapEditor.new
    run
  end

  protected

  def run
    while @@running do
      @user_input = STDIN.gets.chomp
      handle_user_input @user_input
    end
    show_message("Session ended")
  end

  def handle_user_input(user_input)
    input_array = user_input.split(' ')
    if(input_array[0] == 'X')
      @@running = false
    elsif(input_array[0] == 'I')
      @bitmap_editor.create_image(input_array[1],input_array[2])
    elsif(input_array[0] == 'L')
      @bitmap_editor.set_pixel_colour(input_array[1],input_array[2],input_array[3])
    elsif(input_array[0] == 'V')
      @bitmap_editor.draw_vertical_segment(input_array[1],input_array[2],input_array[3], input_array[4])
    elsif(input_array[0] == 'H')
      @bitmap_editor.draw_horizontal_segment(input_array[1],input_array[2],input_array[3], input_array[4])
    elsif(input_array[0] == 'F')
      @bitmap_editor.fill_region(input_array[1],input_array[2],input_array[3])
    elsif(input_array[0] == 'C')
      @bitmap_editor.clear_pixels()
    elsif(input_array[0] == 'S')
      @bitmap_editor.show_pixels()
    else
      show_error("No command found!")
    end
  end

end

InputManager.new