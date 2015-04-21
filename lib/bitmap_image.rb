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
end