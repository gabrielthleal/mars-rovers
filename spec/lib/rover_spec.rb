require 'spec_helper'
require 'rover'
 
RSpec.describe RoverProblem do
  let(:rover) { RoverProblem.new(5,5) } 

  it 'x limit is valid?' do
    expect(rover.limit_x).to be > 0
  end
  it 'y limit is valid?' do
    expect(rover.limit_y).to be > 0
  end

  it 'turn around left' do 
    rover.run_walle_run(0,0,'N','')
    expect(%W[N E S W]).to include(rover.which_side('L'))
  end  
  
  it 'turn around right' do 
    rover.run_walle_run(0,0,'N','')
    expect(%W[N E S W]).to include(rover.which_side('R'))
  end

  it 'first rover deployed' do
    expect(rover.run_walle_run(1,2,'N','LMLMLMLMM')).to eq('1 3 N')
  end

  it 'second rover deployed' do
    expect(rover.run_walle_run(3, 3, 'E','MMRMMRMRRM')).to eq('5 1 E')
  end
end
