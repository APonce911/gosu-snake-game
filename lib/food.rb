class Food
  def initialize(window)
    @window = window
    @x = rand * 640
    @y = rand * 480
    @image = Gosu::Image.new("../media/rat1.gif")
  end

  attr_reader :x, :y, :window

  def draw
    @image.draw(@x, @y, 2, 0.15, 0.15)
  end
end
