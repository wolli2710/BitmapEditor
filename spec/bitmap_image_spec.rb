require_relative '../lib/bitmap_image'

describe BitmapImage do
  
  before(:each) {@bitmap = BitmapImage.new}

  def iterate_trough_pixels
    cnt = 0
    @bitmap.pixels.each_pair do |k,v|
      @bitmap.pixels[k].each_pair do |k1,v1|
        cnt += 1
        expect(v1).to match('O')
      end
    end
    return cnt
  end

  it "should create Bitmap object" do
    expect(@bitmap).to_not be_nil
  end

  it "should have a pixel getter and setter" do
    expect(@bitmap.pixels).to be_nil
    @bitmap.create_pixels(3,3)
    expect(@bitmap.pixels).to_not be_nil
  end

  it "should not create a pixel array greater than 250 x 250" do
    @bitmap.create_pixels(251,250)
    expect(@bitmap.pixels).to be_nil
  end

  it "should have a 250 x 250 pixel array" do
    @bitmap.create_pixels(250,250)
    expect(@bitmap.pixels.size).to equal(250)
    expect(@bitmap.pixels[1].size).to equal(250)
  end

  it "should not have a pixel index 0,0" do
    @bitmap.create_pixels(3,3)
    expect(@bitmap.pixels[0][0]).to be_nil
    expect(@bitmap.pixels[1][0]).to be_nil
    expect(@bitmap.pixels[0][1]).to be_nil
    expect(@bitmap.pixels[1][1]).to_not be_nil
  end

  it "should have all pixels with O initialized" do
    @bitmap.create_pixels(3,3)
    cnt = iterate_trough_pixels()
    expect(cnt).to be(9)
  end

  it "should color a single pixel" do
    @bitmap.create_pixels(3,3)
    @bitmap.set_pixel_colour(1,1,"A")
    expect(@bitmap.pixels[1][1]).to match("A")
  end

  it "should not color a pixel out of bounds" do
    @bitmap.create_pixels(3,3)
    @bitmap.set_pixel_colour(1,0,"A")
    cnt = iterate_trough_pixels()
    expect(cnt).to be(9)
  end

  it "should not set_pixel_colour without previous create_pixels" do
    @bitmap.set_pixel_colour(1,1,"A")
    expect(@bitmap.pixels).to be_nil
  end

  it "should provide method to clear colour" do
    @bitmap.create_pixels(3,3)
    @bitmap.set_pixel_colour(1,1,"A")
    expect(@bitmap.pixels[1][1]).to match("A")
    @bitmap.clear_pixels()
    cnt = iterate_trough_pixels()
    expect(cnt).to be(9)
  end

end