require_relative '../lib/input_manager'
require_relative '../lib/notification'

describe InputManager do
  
  include Notification
  
  before(:each){@input_manager = InputManager.new}
  it "should have params_are_numbers to return true if user_input is correct" do
    expect(@input_manager.params_are_numbers?(2, 2)).to equal(true)
  end

  it "should have params_are_numbers to return false if user_input is incorrect" do
    expect(@input_manager.params_are_numbers?("A", 2)).to equal(false)
  end

  it "should have param_is_single_character to return true if user_input is correct" do
    expect(@input_manager.param_is_single_character?("A")).to equal(true)
  end

  it "should have param_is_single_character to return false if user_input is incorrect" do
    expect(@input_manager.param_is_single_character?("AA")).to equal(false)
    expect(@input_manager.param_is_single_character?("a")).to equal(false)
    expect(@input_manager.param_is_single_character?(1)).to equal(false)
  end

  it "should not allow invalid user input" do
    expect(@input_manager.handle_user_input("V 3 3 1")).to match(show_error("No command found!"))
    expect(@input_manager.handle_user_input("F 3 3")).to match(show_error("No command found!"))
    expect(@input_manager.handle_user_input("V 1 2 3 A 1")).to match(show_error("No command found!"))
    expect(@input_manager.handle_user_input("Z 1 2 3 A")).to match(show_error("No command found!"))
  end

end