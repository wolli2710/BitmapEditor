module ParameterCheck

  #check if given array contains numbers only
  def params_are_numbers?(*args)
    result = true
    args.map{|arg| result &= Integer(arg) rescue nil }
    show_error("No command found!") unless result
    result
  end

  #check if given character is a single character of type string and uppercase
  def param_is_single_character?(arg)
    result = true
    result &= ( arg.size == 1 && arg == arg.upcase && String(arg) rescue nil )
    show_error("No command found!") unless result
    result
  end

end