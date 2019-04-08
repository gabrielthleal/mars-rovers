require 'spec_helper'
require 'rover'
 
describe RoverProblem do
  # let(:rover) {RoverProblem.new(5,5)}
    it 'is x more than valid?' do
      rover = RoverProblem.new(5,5)
      expect(rover.limit_x).to be > 0
    end
    it 'is y more than valid?' do
      rover = RoverProblem.new(5,5)
      expect(rover.limit_y).to be > 0
    end

    it 'first rover deployed and expected movimentation is working!' do
      rover = RoverProblem.new(5,5)
      expect(rover.run_walle_run(1,2,'N','LMLMLMLMM')).to eq('1 3 N')
    end

    it 'second rover deployed and expected movimentation is working!' do
      rover = RoverProblem.new(5,5)
      expect(rover.run_walle_run(3, 3, 'E','MMRMMRMRRM')).to eq('5 1 E')
    end

    # it 'is a valid side?' do
    #   rover = RoverProblem.new(5,5)
    #   rover.run_walle_run(3,2,'E','OPMPMEM')
    #   expect(rover).to eq('L')
    # end
end

  # it 'Sides is L or R?' do
  #   rover = RoverProblem.new(5,5)
  #   @coordenades = rover.run_walle_run(1,2,'N','LMLMLMLMM')
  #   expect(coordenades).to equal('L')
  # end
  #it 'Cardinals points' do
  #  expect(coordenades.@actual_cardinal_letter).to equal('N')
  #end
  #it 'cardinal point is right?'
  #it 'action of moviments is right?'
# end