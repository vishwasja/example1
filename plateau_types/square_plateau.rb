class SquarePlateau

  attr_accessor :left_vertex, :side

  def initialize x, y, side
    @left_vertex = Coordinate.new(x, y)
    @side = side
  end

  def can_rover_move_forward(rover)
    (rover.current_pos.dir == 'N' && rover.current_pos.y < (@left_vertex.y + @side)) ||
        (rover.current_pos.dir == 'S' && rover.current_pos.y > @left_vertex.y) ||
        (rover.current_pos.dir == 'E' && rover.current_pos.x < ( @left_vertex.x + @side)) ||
        (rover.current_pos.dir == 'W' && rover.current_pos.x > @left_vertex.x)
  end

end