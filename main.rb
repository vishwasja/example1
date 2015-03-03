require './coordinate.rb'
require './rover.rb'


class Mission

  attr_accessor :plateau, :rover

  def initialize_plateau pla_x, pla_y
    @plateau = Coordinate.new(pla_x, pla_y)
  end

  def initialize_rover x,y,dir
    @rover = Rover.new(x,y,dir)
  end

  def control_rover instructions
    instructions.each_char do |instruction|
      if instruction == 'M'
        unless (rover.current_pos.dir == 'N' && rover.current_pos.y == plateau.y) ||
               (rover.current_pos.dir == 'S' && rover.current_pos.y == 0) ||
               (rover.current_pos.dir == 'E' && rover.current_pos.x == plateau.x) ||
               (rover.current_pos.dir == 'W' && rover.current_pos.x == 0)
            @rover.follow(instruction)

        end
      else
        @rover.follow(instruction)
      end
    end
  end

end



input = [5,5,3,1,'E', 'MRMLMRMLMLLMLMRRM', 3, 3, 'E', 'MMRMMRMRRM']



mission1 = Mission.new
mission1.initialize_plateau(input[0], input[1])
mission1.initialize_rover(input[2], input[3], input[4])


mission1.control_rover(input[5])

rover1 = mission1.rover

puts "#{rover1.current_pos.x } #{rover1.current_pos.y } #{ rover1.current_pos.dir}"

mission1.initialize_rover(input[6], input[7], input[8])

mission1.control_rover(input[9])

rover2 = mission1.rover

puts "#{rover2.current_pos.x } #{rover2.current_pos.y} #{ rover2.current_pos.dir}"