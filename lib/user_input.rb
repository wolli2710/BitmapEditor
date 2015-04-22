require_relative 'bitmap_editor'
require_relative 'parameter_check'

module UserInput
  
  include ParameterCheck

  def handle_user_input(user_input)
    input_array = user_input.split(' ')
    case input_array.size
    when 1
      handle_single_character_input(input_array[0])
    when 3
      create_image(input_array)
    when 4
      handle_image_colouring(input_array)
    when 5
      handle_segmentational_image_colouring(input_array)
    else
      show_error("No command found!")
    end
  end

  def handle_single_character_input(user_input)
    case user_input
    when 'X'
      @@running = false
    when 'S'
      @bitmap_editor.show_pixels()
    when 'C'
      @bitmap_editor.clear_pixels()
    when 'P'
      print_session_commands
    else
      show_error("No command found!")
    end
  end

  def handle_image_colouring(input_array)
    arg2 = input_array[1]
    arg3 = input_array[2]
    arg4 = input_array[3]
    if(params_are_numbers?(arg2,arg3) && param_is_single_character?(arg4))
      if(input_array[0] == 'L')
        @bitmap_editor.set_pixel_colour(arg2,arg3,arg4)
      elsif(input_array[0] == 'F')
        @bitmap_editor.fill_region(arg2,arg3,arg4)
      else
        show_error("No command found!")
      end
    end
  end

  def handle_segmentational_image_colouring(input_array)
    arg2 = input_array[1]
    arg3 = input_array[2]
    arg4 = input_array[3]
    arg5 = input_array[4]
    if(params_are_numbers?(arg2,arg3,arg4) && param_is_single_character?(arg5))
      if(input_array[0] == 'V')
        @bitmap_editor.draw_vertical_segment(arg2,arg3,arg4,arg5)
      elsif(input_array[0] == 'H')
        @bitmap_editor.draw_horizontal_segment(arg2,arg3,arg4,arg5)
      else
        show_error("No command found!")
      end
    end
  end

  def create_image(input_array)
    arg2 = input_array[1]
    arg3 = input_array[2]
    if input_array[0] == 'I' && params_are_numbers?(arg2, arg3)
      @bitmap_editor.create_image(arg2, arg3)
    else
      show_error("No command found!")
    end
  end

end