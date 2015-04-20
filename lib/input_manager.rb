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
    instructions_array = user_input.split(' ')
    if(instructions_array[0] == 'X')
      @@running = false
    end
  end

end

InputManager.new