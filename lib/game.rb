require 'gosu'
require_relative 'snake'
require_relative 'food'

class SnakeGame < Gosu::Window
  def initialize
    super 640, 480
    @window = self
    self.caption = "Snake Game"
    @background_image = Gosu::Image.new("../media/grama4.jpg", :tileable => true)

    @snake = Snake.new(@window)
    @snake.warp(320, 240)
    @foods = Array.new
    @font = Gosu::Font.new(20)

    @fx = 640.0 / @background_image.width
    @fy = 480.0 / @background_image.height

  end
  attr_reader :fy, :fx, :window
  # game logic, ate check, testing for collisions.
  def update

    if Gosu.button_down? Gosu::KB_LEFT
      @snake.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT
      @snake.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP
      @snake.accelerate
    end

    @snake.move
    @snake.collect_foods(@foods)
    if rand(100) < 2 && @foods.size < 10
      @foods.push(Food.new(@window))
    end
  end

  def draw
    @background_image.draw(0, 0, 1, @fx, @fy)
    @snake.draw
    @foods.each { |food| food.draw }
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

SnakeGame.new.show

# /home/aponce911/code/APonce911/fullstack-challenges/02-OOP/05-Food-Delivery-Day-One/01-Food-Delivery
