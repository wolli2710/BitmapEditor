require_relative 'input_manager'

class Start
  def initialize
    @input_manager = InputManager.new
    @input_manager.run
  end
end

Start.new