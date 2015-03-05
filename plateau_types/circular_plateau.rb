class CircularPlateau

  attr_accessor :center, :radius

  def initialize x, y, radius
    @center = Coordinate.new(x,y)
    @radius = radius
  end

  def can_rover_move_forward(rover)
    case rover.current_pos.dir
      when 'E'
        (rover.current_pos.x - @center.x + 1) ** 2 + (rover.current_pos.y - @center.y) ** 2 <= (@radius ** 2)
      when 'W'
        (rover.current_pos.x - @center.x - 1) ** 2 + (rover.current_pos.y - @center.y) ** 2 <= (@radius ** 2)
      when 'N'
        (rover.current_pos.x - @center.x) ** 2 + (rover.current_pos.y - @center.y + 1) ** 2 <= (@radius ** 2)
      when 'S'
        (rover.current_pos.x - @center.x) ** 2 + (rover.current_pos.y - @center.y - 1) ** 2 <= (@radius ** 2)
    end
  end

end