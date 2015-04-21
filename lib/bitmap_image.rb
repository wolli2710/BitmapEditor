class BitmapImage

  attr_reader :pixels

  def create_pixels(rows, columns)
    @columns = columns.to_i
    @rows = rows.to_i
    if is_in_range?(@rows, @columns)
      @pixels = Hash.new{ |h,k| h[k] = Hash.new }
      (1..@columns).map{|i| (1..@rows).map{|j| @pixels[i][j] = 'O' } }
    else
      puts "Error: your Image can't be bigger than #{MAX_SIZE}"
    end
  end

  def set_pixel_colour(x,y,colour)
    x = x.to_i
    y = y.to_i
    if is_index_present?(x,y)
      @pixels[y][x] = colour
    else
      puts "Error: your Image does not contain the Pixel at X:#{x} and Y:#{y}"
    end
  end

  def clear_pixels
    create_pixels(@rows, @columns)
  end

  def show_pixels
    @pixels.each_pair do |key1,val1|
      @pixels[key1].each_pair do |key2,val2|
        print val2
      end
      puts ""
    end
  end

  def draw_vertical_segment(x, y1, y2, colour)
    x = x.to_i
    y1 = y1.to_i
    y2 = y2.to_i
    if are_indices_present?(x,x,y1,y2)
      draw_segment(x, x, y1, y2, colour)
    else
      puts "Error: your Image does not contain some of the coordinates for the segment you provided"
    end
  end

  def draw_horizontal_segment(x1, x2, y, colour)
    x1 = x1.to_i
    x2 = x2.to_i
    y = y.to_i
    if are_indices_present?(x1,x2,y,y)
      draw_segment(x1, x2, y, y, colour)
    else
      puts "Error: your Image does not contain some of the coordinates for the segment you provided"
    end
  end

  def draw_segment(x1, x2, y1, y2, colour)
    (x1..x2).each{|x| (y1..y2).each{ |y| @pixels[y][x] = colour } }
  end


  private
  @pixels
  @columns
  @rows

  MAX_SIZE = 250

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

end