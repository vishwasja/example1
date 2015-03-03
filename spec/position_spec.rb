require 'spec_helper'

describe Position do

  context 'create new position' do

    it 'should create new position with the given inputs' do
      pos1= Position.new(5,5,'N')
      expect(pos1.x).to eq 5
      expect(pos1.y).to eq 5
      expect(pos1.dir).to eq 'N'
    end


  end

  describe 'turn_left' do

    before do
      @pos1 = Position.new(5,5, 'W')
      @pos1.turn_left
    end

    # let(:new_pos) {  }
    it 'should turn left by 90 degrees to south direction' do
      expect(@pos1.dir).to eq 'S'
    end

  end

end