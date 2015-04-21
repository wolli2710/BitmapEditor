require_relative "bitmap_image"
require_relative 'notification'

class BitmapEditor
  include Notification
  attr_reader :pixels

  def initialize
    @bitmap_image = BitmapImage.new
  end

  def create_image(rows, columns)
    @bitmap_image.create_pixels(rows, columns)
  end

  def get_pixels
    @bitmap_image.pixels
  end

  def set_pixel_colour(x,y,colour)
    x = x.to_i
    y = y.to_i
    @bitmap_image.set_pixel_colour(x,y,colour)
  end

  def clear_pixels
    @bitmap_image.clear_pixels
  end

  def show_pixels
    pixels = get_pixels
    pixels.each_pair do |key1,val1|
      pixels[key1].each_pair do |key2,val2|
        print val2
      end
      puts ""
    end
  end

  def draw_vertical_segment(x, y1, y2, colour)
    x = x.to_i
    y1 = y1.to_i
    y2 = y2.to_i
    if @bitmap_image.are_indices_present?(x,x,y1,y2)
      draw_segment(x, x, y1, y2, colour)
    else
      show_error("your Image does not contain some of the coordinates for the segment you provided")
    end
  end

  def draw_horizontal_segment(x1, x2, y, colour)
    x1 = x1.to_i
    x2 = x2.to_i
    y = y.to_i
    if @bitmap_image.are_indices_present?(x1,x2,y,y)
      draw_segment(x1, x2, y, y, colour)
    else
      show_error("your Image does not contain some of the coordinates for the segment you provided")
    end
  end

  def draw_segment(x1, x2, y1, y2, colour)
    (x1..x2).each{|x| (y1..y2).each{ |y| set_pixel_colour(x,y,colour) } }
  end

  def fill_region(x, y, colour)
    x = x.to_i
    y = y.to_i
    @bitmap_image.fill_region(x,y,colour)
  end

end