class Segment
  attr_accessor :x, :y

  def initialize(snake, position)
    @x = position[0]
    @y = position[1]
  end

  def draw
    p "drawing Segments"
    Gosu.draw_quad(@x,      @y,      Gosu::Color::BLACK,
                   @x + 20, @y,      Gosu::Color::BLACK,
                   @x + 20, @y + 20, Gosu::Color::BLACK,
                   @x,      @y + 20, Gosu::Color::BLACK,
                   4)
  end
end
