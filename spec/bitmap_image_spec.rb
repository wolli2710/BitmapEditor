require_relative '../lib/bitmap_image'

describe BitmapImage do
  
  before(:each) {@bitmap = BitmapImage.new}

  it "should create BitmapImage object" do
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

  it "should color a single pixel" do
    @bitmap.create_pixels(3,3)
    @bitmap.set_pixel_colour(1,1,"A")
    expect(@bitmap.pixels[1][1]).to match("A")
  end

end