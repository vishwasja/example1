require 'pry'
require './coordinate.rb'

class Position < Coordinate

  attr_accessor :dir

  DIRECTIONS_TO_ANGLES = { 'W' => 0, 'N' => 90, 'E' => 180, 'S' => 270 }

  ANGLES_TO_DIRECTION = { 0 => 'W', 90 => 'N', 180 => 'E', 270 => 'S' }

  def initialize x, y, dir
    super(x,y)
    @dir = dir
  end

  def turn_left
    # binding.pry
    current_angle = DIRECTIONS_TO_ANGLES[@dir]
    new_angle = current_angle - 90
    @dir = calculate_new_direction(new_angle)
  end

  def turn_right

    current_angle = DIRECTIONS_TO_ANGLES[@dir]
    new_angle = current_angle + 90
    @dir = calculate_new_direction(new_angle)
  end

  def move_forward
    case @dir
      when 'W'
        @x -= 1
      when 'E'
        @x += 1
      when 'N'
        @y += 1
      when 'S'
        @y -= 1
    end
  end

  def calculate_new_direction new_angle
    if new_angle < 0
      new_angle += 360
    end

    if new_angle >= 360
      new_angle -= 360
    end

    ANGLES_TO_DIRECTION[new_angle]
  end

end