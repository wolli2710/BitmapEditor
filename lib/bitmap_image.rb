require_relative 'notification'

class BitmapImage
  include Notification
  attr_accessor :pixels

  def create_pixels(rows, columns)
    @columns = columns.to_i
    @rows = rows.to_i
    if is_in_range?(@rows, @columns)
      @pixels = Hash.new{ |h,k| h[k] = Hash.new }
      (1..@columns).map{|i| (1..@rows).map{|j| @pixels[i][j] = 'O' } }
    else
      show_error("your Image can't be bigger than #{MAX_SIZE}")
    end
  end

  def set_pixel_colour(x,y,colour)
    if is_index_present?(x,y)
      @pixels[y][x] = colour
    else
      show_error("your Image does not contain the Pixel at X:#{x} and Y:#{y}")
    end
  end

  def clear_pixels
    create_pixels(@rows, @columns)
  end

  def fill_region(x, y, colour)
    if is_index_present?(x,y)
      colour2 = @pixels[y][x]
      fill_region_with_colour(colour, colour2)
    else
      show_error("your Image does not contain the Pixel at X:#{x} and Y:#{y}")
    end
  end

  def fill_region_with_colour(colour, colour2)
    (1..@rows).each do |x| 
      (1..@columns).each do |y| 
        @pixels[y][x] = colour if @pixels[y][x] == colour2
      end
    end
  end

  def is_in_range?(rows, columns)
    result = false
    result = true if rows <= MAX_SIZE && columns <= MAX_SIZE
    result
  end

  def is_index_present?(x,y)
    result = false
    result = true if !@pixels.nil? && @pixels.has_key?(x) && @pixels[x].has_key?(y)
    result
  end

  def are_indices_present?(x1,x2,y1,y2)
    result = true
    (x1..x2).each{|x| (y1..y2).each{ |y| result = result && is_index_present?(x,y) } }
    result
  end

  private
  @pixels
  @columns
  @rows

  MAX_SIZE = 250

end