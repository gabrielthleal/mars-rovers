class RoverProblem
  CARDINAL_LETTERS = %w{N E S W}.freeze
  
  def initialize(x, y)
    @limit_x = x
    @limit_y = y
  end
  
  def run_walle_run(x, y, cardinal, action)
    @y = y
    @x = x
    @actual_cardinal_letter = cardinal
    arr_action = action.split('') 

    arr_action.each do |movement|
     which_side(movement)
     move_foward(movement)
     you_shall_not_pass if @x > @limit_x || @y > @limit_y  
    end
    puts "#{@x} #{@y} #{@actual_cardinal_letter}" 
  end

  private

  def which_side(side)
    if side == 'L' 
      @actual_cardinal_letter = CARDINAL_LETTERS[find_cardinal_index - 1] 
    elsif side == 'R'
      @actual_cardinal_letter = CARDINAL_LETTERS[@actual_cardinal_letter == 'W' ? 0 : find_cardinal_index + 1]
    end 
  end

  def move_foward(step)
    if step == 'M'
      @y += 1 if @actual_cardinal_letter == 'N'  
      @x += 1 if @actual_cardinal_letter == 'E'  
      @y -= 1 if @actual_cardinal_letter == 'S'  
      @x -= 1 if @actual_cardinal_letter == 'W'
    end
  end

  def you_shall_not_pass
    @x -= (@x - @limit_x)
    @y -= (@y - @limit_y)
  end

  def find_cardinal_index
    case @actual_cardinal_letter
      when 'N'
        0
      when 'E'
        1
      when 'S'
        2
      when 'W'
        3    
    end
  end 
end