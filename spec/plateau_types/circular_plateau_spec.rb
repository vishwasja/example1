require 'spec_helper'

describe CircularPlateau do

  context 'create a new plateau' do

    before do
      @plateau = CircularPlateau.new(5, 5, 2)
    end

    it 'should have center at coordinate provided' do
      expect( @plateau.center.x ).to eq 5
      expect( @plateau.center.y ).to eq 5
    end

    it 'should have radius equal to length passed' do
      expect( @plateau.radius ).to eq 2
    end

  end

  context 'ensure rover can move ahead on the plateau' do

    before do
      @plateau = CircularPlateau.new(5, 5, 2)
    end

    it 'should be able to move within the plateau' do
      rover = Rover.new(6, 5, 'N')
      expect(@plateau.can_rover_move_forward(rover)).to eq true
    end

    it 'should be not be able to move out of the plateau' do
      rover = Rover.new(6, 6, 'E')
      expect(@plateau.can_rover_move_forward(rover)).to eq false
    end
  end

end