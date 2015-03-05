require 'spec_helper'

describe SquarePlateau do

  before do
    @plateau = SquarePlateau.new(5, 5, 3)
  end

  context 'create a new plateau' do

    it 'should have left vertex at coordinate provided' do
      expect( @plateau.left_vertex.x ).to eq 5
      expect( @plateau.left_vertex.y ).to eq 5
    end

    it 'should have side equal to length provided' do
      expect( @plateau.side ).to eq 3
    end

  end

  context 'ensure rover can move ahead on the plateau' do

    it 'should be able to move within the plateau' do
      rover = Rover.new(6, 5, 'N')
      expect(@plateau.can_rover_move_forward(rover)).to eq true
    end

    it 'should be not be able to move out of the plateau' do
      rover = Rover.new(8, 8, 'E')
      expect(@plateau.can_rover_move_forward(rover)).to eq false
    end
  end

end