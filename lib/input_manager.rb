require_relative "bitmap_image.rb"

class InputManager
  @@running = true
  @user_input 

  def initialize
    @bitmap_image = BitmapImage.new
    InputManager.run
  end

  protected

  def self.run
    while @@running do
      @user_input = STDIN.gets.chomp
      InputManager.handle_user_input @user_input
    end
    puts "Session ended"
  end

  def self.handle_user_input(user_input)
    input_array = user_input.split(' ')
    if(input_array[0] == 'X')
      @@running = false
    elsif(input_array[0] == 'L')
      @bitmap.set_pixel_colour(input_array[1],input_array[2],input_array[3])
    end
  end

end

InputManager.new