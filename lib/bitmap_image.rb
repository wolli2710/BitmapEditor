class BitmapImage

  attr_reader :pixels

  def create_pixels(rows, columns)
    @columns = columns
    @rows = rows
    if is_in_range?(rows, columns)
      @pixels = Hash.new{ |h,k| h[k] = Hash.new }
      (1..rows).map{|i| (1..columns).map{|j| @pixels[i][j] = 'O' } }
    else
      puts "Error: your Image can't be bigger than #{MAX_SIZE}"
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
end