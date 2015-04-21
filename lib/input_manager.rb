require_relative "bitmap_image"

class InputManager
  @@running = true
  @user_input 

  def initialize
    @bitmap_image = BitmapImage.new
    run
  end

  protected

  def run
    while @@running do
      @user_input = STDIN.gets.chomp
      handle_user_input @user_input
    end
    puts "Session ended"
  end

  def handle_user_input(user_input)
    input_array = user_input.split(' ')
    if(input_array[0] == 'X')
      @@running = false
    elsif(input_array[0] == 'I')
      @bitmap_image.create_pixels(input_array[1],input_array[2])
    elsif(input_array[0] == 'L')
      @bitmap_image.set_pixel_colour(input_array[1],input_array[2],input_array[3])
    elsif(input_array[0] == 'V')
      @bitmap_image.draw_vertical_segment(input_array[1],input_array[2],input_array[3], input_array[4])
    elsif(input_array[0] == 'H')
      @bitmap_image.draw_horizontal_segment(input_array[1],input_array[2],input_array[3], input_array[4])
    elsif(input_array[0] == 'F')
      @bitmap_image.fill_region(input_array[1],input_array[2],input_array[3])
    elsif(input_array[0] == 'C')
      @bitmap_image.clear_pixels()
    elsif(input_array[0] == 'S')
      @bitmap_image.show_pixels()
    end
  end

end

InputManager.new