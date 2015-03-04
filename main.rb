require './coordinate.rb'
require './rover.rb'


class Mission

  attr_accessor :plateau, :rover

  def initialize_plateau type, pla_x, pla_y, length
    @plateau = Plateau.new(type, pla_x, pla_y, length)
  end

  def initialize_rover x,y,dir
    @rover = Rover.new(x,y,dir)
  end

  def control_rover instructions
    instructions.each_char do |instruction|
      if instruction == 'M'
        if plateau.can_rover_move_forward(@rover)
          @rover.follow(instruction)
        end
      else
        @rover.follow(instruction)
      end
    end
  end

end



class Plateau

  attr_accessor :type, :pos

  def initialize type, x, y, length
    @type, @length = type, length
    @pos = Coordinate.new(x,y)
  end

  def can_rover_move_forward(rover)
    case type
      when 'CIRCLE'
        case rover.current_pos.dir
          when 'E'
            (rover.current_pos.x - @pos.x + 1) ** 2 + (rover.current_pos.y - @pos.y) ** 2 <= (@length ** 2)
          when 'W'
            (rover.current_pos.x - @pos.x - 1) ** 2 + (rover.current_pos.y - @pos.y) ** 2 <= (@length ** 2)
          when 'N'
            (rover.current_pos.x - @pos.x) ** 2 + (rover.current_pos.y - @pos.y + 1) ** 2 <= (@length ** 2)
          when 'S'
            (rover.current_pos.x - @pos.x) ** 2 + (rover.current_pos.y - @pos.y - 1) ** 2 <= (@length ** 2)
        end
      when 'SQUARE'
        (rover.current_pos.dir == 'N' && rover.current_pos.y < (pos.y + @length)) ||
        (rover.current_pos.dir == 'S' && rover.current_pos.y > pos.y) ||
        (rover.current_pos.dir == 'E' && rover.current_pos.x < ( pos.x + @length)) ||
        (rover.current_pos.dir == 'W' && rover.current_pos.x > pos.x)
    end
  end

end




input = ["CIRCLE", 5, 5, 2,6, 5, 'N', 'MRMLMLMRMRRM',
         "SQUARE", 3, 4, 5, 6, 5, 'N', 'MRMLMLMRMRRM']



mission1 = Mission.new
mission1.initialize_plateau(input[0], input[1], input[2], input[3])
mission1.initialize_rover(input[4], input[5], input[6])


mission1.control_rover(input[7])

rover1 = mission1.rover

puts "#{rover1.current_pos.x } #{rover1.current_pos.y } #{ rover1.current_pos.dir}"

mission1.initialize_plateau(input[8], input[9], input[10], input[11])

mission1.initialize_rover(input[12], input[13], input[14])

mission1.control_rover(input[15])

rover2 = mission1.rover

puts "#{rover2.current_pos.x } #{rover2.current_pos.y} #{ rover2.current_pos.dir}"