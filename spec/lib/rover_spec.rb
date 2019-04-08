require 'spec_helper'
require 'rover'
 
describe RoverProblem do
  it 'has a valid limit?' do
    rover = RoverProblem.new(5,5)
    expect(rover.limit_x).to be <= 5
    expect(rover.limit_y).to be <= 5
  end
  it 'Sides is L or R?' do
    rover = RoverProblem.new(5,5)
    @coordenades = rover.run_walle_run(1,2,'N','LMLMLMLMM')
    expect(coordenades).to equal('L')
  end
  #it 'Cardinals points' do
  #  expect(coordenades.@actual_cardinal_letter).to equal('N')
  #end
  #it 'cardinal point is right?'
  #it 'action of moviments is right?'
end