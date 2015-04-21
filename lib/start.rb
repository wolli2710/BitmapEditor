require_relative 'input_manager'

class Start
  def initialize
    @input_manager = InputManager.new
    @input_manager.start
  end
end