require './coordinate.rb'
require './rover.rb'
require './plateau_types/circular_plateau'
require './plateau_types/square_plateau'

class Mission

  attr_accessor :plateau, :rover

  def initialize_plateau type, pla_x, pla_y, length
    case type
      when 'CIRCLE'
        @plateau = CircularPlateau.new(pla_x, pla_y, length)
      when 'SQUARE'
        @plateau = SquarePlateau.new(pla_x, pla_y, length)
    end
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