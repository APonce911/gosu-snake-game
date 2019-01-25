
require_relative 'segment'
class Snake
#We will draw a 20x20 white square to represent the snake's head. Let's
# introduce the Snake class with a SIZE constant and refactor the Game's
# initialize method to build a window proportional to the snake's size.


  def initialize(window)
    @window = window
    @segments = []
    @x = @y = 50
    @vel_x = @vel_y = @angle = 0.0
    @score = 0
    @direction = "up"
    @head = Gosu::Image.new("../media/snakehead.png")
    # @head = Segment.new(self, [@x, @y])
    @segments << @head


    @beep1 = Gosu::Sample.new("../media/snakeatt.wav")
    @beep2 = Gosu::Sample.new("../media/mouse_02.wav")
    @beep3 = Gosu::Sample.new("../media/mouse_03.wav")
    @beep = [@beep1, @beep2, @beep3]
  end
  attr_accessor :direction
  attr_reader :x, :y


  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end

  def accelerate
    @vel_x += Gosu.offset_x(@angle, 0.25)
    @vel_y += Gosu.offset_y(@angle, 0.25)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480

    @vel_x *= 0.95
    @vel_y *= 0.95
    new_segment = Segment.new(self, [@x, @y])
    @segments.unshift(new_segment) # boto o novo segmento na frente do array
    @segments.pop # excluo o ultimo elemento do array

  end

  def draw
    @head.draw_rot(@x, @y, 3, @angle, 0.5, 0.5, 0.01 * @score + 0.10, 0.01 * @score + 0.10)
     p @x
     p @y
     seg_n_px = @segments.size * 20
    # Gosu.draw_rect(@x, @y, 20, 20, Gosu::Color::BLACK, 3, :default)
    # @segments.each { |segment| segment.draw }
  end

  def score
    @score
  end

  def add_segment

  end


  def collect_foods(foods)
    foods.reject! do |food|
      if Gosu.distance(@x, @y, food.x, food.y) < 35
        @score += 10
        @beep.sample.play
        true
        # add segment, if direction segments << Segment.new #falta (snake,position[x, y])
      else
        false
      end
    end
  end
end

      # x = @head_segment.x
      # y = @head_segment.y - @speed
      # new_segment = Segment.new(self, @window, [x, y])
