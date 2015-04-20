class BitmapImage

  attr_reader :pixels

  def create_pixels(rows, colums)
    if rows <= MAX_SIZE && colums <= MAX_SIZE
      @pixels = Array.new(rows) { Array.new(colums) {|i| 'O'} }
    else
      puts "Error: your Image can't be bigger than #{MAX_SIZE}"
    end
  end

  private
  @pixels
  MAX_SIZE = 250
end