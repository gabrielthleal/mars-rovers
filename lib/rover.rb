class RoverProblem
  CARDINAL_LETTERS = %w[N E S W].freeze
  attr_accessor :limit_x
  attr_accessor :limit_y

  def initialize(x, y)
    @limit_x = x.to_i
    @limit_y = y.to_i
  end
  # retorno do problema
  def run_walle_run(x, y, cardinal_position, action)
    @y = y.to_i
    @x = x.to_i
    @cardinal_position = cardinal_position.to_s.upcase

    action.each_char do |mov|
      looking_at = which_side(mov) 
      @cardinal_position = actual_cardinal_position(looking_at) 
      move_foward(mov, @cardinal_position)

      you_shall_not_pass if @x > @limit_x || @y > @limit_y  
    end
    "#{@x} #{@y} #{@cardinal_position}" 
  end

  private
#retorno da letra cardinal
  def which_side(side)
    raise 'invalid value' if !['L', 'R', 'M'].include?(side.to_s.upcase)
    if side == 'L' 
      CARDINAL_LETTERS[find_cardinal_index - 1] 
    elsif side == 'R'
      CARDINAL_LETTERS[@cardinal_position == 'W' ? 0 : find_cardinal_index + 1]
    end 
  end

  def actual_cardinal_position(actual_position) 
    if actual_position.nil?
      @cardinal_position
    else
      actual_position
    end
  end

  def move_foward(step, looking_at)
    if step == 'M'
      @y += 1 if looking_at == 'N'  
      @x += 1 if looking_at == 'E'  
      @y -= 1 if looking_at == 'S'  
      @x -= 1 if looking_at == 'W'
    end
  end
# retorno do x ou y limitado
  def you_shall_not_pass
    @x -= (@x - @limit_x)
    @y -= (@y - @limit_y)
  end
# retorna index
  def find_cardinal_index
    CARDINAL_LETTERS.index(@cardinal_position)
  end 
end