require_relative '../lib/bitmap_editor'

describe BitmapImage do
  
  before(:each) {@bitmap_editor = BitmapEditor.new}

  def iterate_trough_pixels(colour)
    cnt = 0
    @bitmap_editor.get_pixels.each_pair do |key1,val1|
      @bitmap_editor.get_pixels[key1].each_pair do |key2,val2|
        cnt += 1
        expect(val2).to match(colour)
      end
    end
    return cnt
  end

  it "should create BitmapEditor object" do
    expect(@bitmap_editor).to_not be_nil
  end

  it "should have a method create_image and a pixel getter" do
    expect(@bitmap_editor.get_pixels).to be_nil
    @bitmap_editor.create_image(3,3)
    expect(@bitmap_editor.get_pixels).to_not be_nil
  end

  it "should not create a pixel array greater than 250 x 250" do
    @bitmap_editor.create_image(251,250)
    expect(@bitmap_editor.get_pixels).to be_nil
  end

  it "should have a 250 x 250 pixel array" do
    @bitmap_editor.create_image(250,250)
    expect(@bitmap_editor.get_pixels.size).to equal(250)
    expect(@bitmap_editor.get_pixels[1].size).to equal(250)
  end

  it "should not have a pixel index 0,0" do
    @bitmap_editor.create_image(3,3)
    expect(@bitmap_editor.get_pixels[0][0]).to be_nil
    expect(@bitmap_editor.get_pixels[1][0]).to be_nil
    expect(@bitmap_editor.get_pixels[0][1]).to be_nil
    expect(@bitmap_editor.get_pixels[1][1]).to_not be_nil
  end

  it "should have all pixels with O initialized" do
    @bitmap_editor.create_image(3,3)
    cnt = iterate_trough_pixels('O')
    expect(cnt).to be(9)
  end

  it "should color a single pixel" do
    @bitmap_editor.create_image(3,3)
    @bitmap_editor.set_pixel_colour(1,1,"A")
    expect(@bitmap_editor.get_pixels[1][1]).to match("A")
  end

  it "should not color a pixel out of bounds" do
    @bitmap_editor.create_image(3,3)
    @bitmap_editor.set_pixel_colour(1,0,"A")
    cnt = iterate_trough_pixels('O')
    expect(cnt).to be(9)
  end

  it "should not set_pixel_colour without previous create_image" do
    @bitmap_editor.set_pixel_colour(1,1,"A")
    expect(@bitmap_editor.get_pixels).to be_nil
  end

  it "should provide method to clear colour" do
    @bitmap_editor.create_image(3,3)
    @bitmap_editor.set_pixel_colour(1,1,"A")
    expect(@bitmap_editor.get_pixels[1][1]).to match("A")
    @bitmap_editor.clear_pixels()
    cnt = iterate_trough_pixels('O')
    expect(cnt).to be(9)
  end

  it "should provide method show pixels" do
    @bitmap_editor.create_image(3,3)
    @bitmap_editor.set_pixel_colour(1,1,"A")
    expect(@bitmap_editor.show_pixels).to_not be_nil
  end

  it "should draw_vertical_segment" do
    @bitmap_editor.create_image(3,3)
    expect(@bitmap_editor.get_pixels[1][1]).to_not match("A")
    @bitmap_editor.draw_vertical_segment(1,1,2,"A")
    expect(@bitmap_editor.get_pixels[1][1]).to match("A")
    expect(@bitmap_editor.get_pixels[2][1]).to match("A")
    expect(@bitmap_editor.get_pixels[1][3]).to match("O")
  end

  it "should not draw_vertical_segment" do
    @bitmap_editor.create_image(3,3)
    @bitmap_editor.draw_vertical_segment(1,2,5,"A")
    expect(@bitmap_editor.get_pixels[2][1]).to_not match("A")
    expect(@bitmap_editor.get_pixels[5][1]).to_not match("A")
  end

  it "should draw_horizontal_segment" do
    @bitmap_editor.create_image(3,3)
    @bitmap_editor.draw_horizontal_segment(1,2,2,"A")
    expect(@bitmap_editor.get_pixels[2][1]).to match("A")
    expect(@bitmap_editor.get_pixels[2][2]).to match("A")
    expect(@bitmap_editor.get_pixels[2][3]).to match("O")
  end

  it "should not draw_horizontal_segment" do
    @bitmap_editor.create_image(3,3)
    @bitmap_editor.draw_vertical_segment(1,2,5,"A")
    expect(@bitmap_editor.get_pixels[5][1]).to_not match("A")
    expect(@bitmap_editor.get_pixels[5][2]).to_not match("A")
  end

  it "should fill_region" do
    @bitmap_editor.create_image(3,3)
    @bitmap_editor.draw_horizontal_segment(1,2,2,"B")
    @bitmap_editor.fill_region(2,2,"A")
    expect(@bitmap_editor.get_pixels[2][1]).to match("A")
    expect(@bitmap_editor.get_pixels[2][2]).to match("A")
    expect(@bitmap_editor.get_pixels[2][3]).to match("O")
  end

  it "should not fill_region" do
    @bitmap_editor.create_image(3,3)
    @bitmap_editor.fill_region(4,2,"A")
    cnt = iterate_trough_pixels('O')
    expect(cnt).to equal(9)
  end

end