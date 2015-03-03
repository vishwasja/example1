require './coordinate.rb'
require './position.rb'



class Rover

  attr_accessor :current_pos

  def initialize x, y, dir
    @current_pos = Position.new(x,y,dir)
  end

  def follow instruction
    case instruction
      when 'L'
        @current_pos.turn_left
      when 'R'
        @current_pos.turn_right
      when 'M'
        @current_pos.move_forward
    end
  end


end

