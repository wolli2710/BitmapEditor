require_relative '../lib/bitmap_image'

describe BitmapImage do
  
  before(:each) {@bitmap = BitmapImage.new}

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

  it "should have no pixel index 0,0" do
    @bitmap.create_pixels(3,3)
    expect(@bitmap.pixels[0][0]).to be_nil
    expect(@bitmap.pixels[1][0]).to be_nil
    expect(@bitmap.pixels[0][1]).to be_nil
    expect(@bitmap.pixels[1][1]).to_not be_nil
  end

  it "should have all pixels with O initialized" do
    @bitmap.create_pixels(3,3)
    cnt = 0
    @bitmap.pixels.each_pair do |k,v|
      @bitmap.pixels[k].each_pair do |k1,v1|
        cnt += 1
        expect(v1).to match('O')
      end
    end
    expect(cnt).to be(9)
  end

end