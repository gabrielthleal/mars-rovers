require 'spec_helper'
require 'rover'
 
describe RoverProblem do
  it 'is x more than valid?' do
    rover = RoverProblem.new(5,5)
    expect(rover.limit_x).to be > 0
  end
  it 'is y more than valid?' do
    rover = RoverProblem.new(5,5)
    expect(rover.limit_y).to be > 0
  end

  it 'turn around left' do 
    rover = RoverProblem.new(5, 5)
    rover.run_walle_run(0,0,'N','')
    expect(%W[N E S W]).to include(rover.which_side('L'))
  end  
  
  it 'turn around right' do 
    rover = RoverProblem.new(5, 5)
    rover.run_walle_run(0,0,'N','')
    expect(%W[N E S W]).to include(rover.which_side('R'))
  end

  it 'first rover deployed' do
    rover = RoverProblem.new(5,5)
    expect(rover.run_walle_run(1,2,'N','LMLMLMLMM')).to eq('1 3 N')
  end

  it 'second rover deployed' do
    rover = RoverProblem.new(5,5)
    expect(rover.run_walle_run(3, 3, 'E','MMRMMRMRRM')).to eq('5 1 E')
  end
end
