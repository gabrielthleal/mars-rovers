# 5 5
# 1 2 N 
# LMLMLMLMM --> 1 3 N
# 3 3 E 
# MMRMMRMRRM --> 5 1 E

class RoverProblem
  def initialize(x, y)
    @limit_x = x
    @limit_y = y
  end
  
  def run_walle_run(x, y, cardinal, move)
    cardinals_letter = %w{N E S W}
    @y = y
    @x = x
    @actual_point = cardinal

    puts "Inicio #{@y} #{@x} #{@actual_point}"
    arr_move = move.split('') # lembrar de excluir tudo que não fore de acordo. ou tratar nos testes.

    arr_move.each do |mov|
      
      # cada movimento é o ponto cardinal atual 
      #  DEFINE A DIREÇÃO SEGUNDO OS PONTOS CARDINAIS
      if mov == 'L' 
        @actual_point = cardinals_letter[find_cardinal_index_number - 1] 
      elsif mov == 'R'
        @actual_point = cardinals_letter[@actual_point == 'W' ? 0 : find_cardinal_index_number + 1]
      end 
      
      if mov == 'M'
        @y += 1 if @actual_point == 'N'  
        @x += 1 if @actual_point == 'E'  
        @y -= 1 if @actual_point == 'S'  
        @x -= 1 if @actual_point == 'W'
      end
      
      @x -= you_shall_not_pass(@x, @limit_x) if @x > @limit_x
      @y -= you_shall_not_pass(@y, @limit_y) if @y > @limit_y       
    end

    "#{@x} #{@y} #{@actual_point}"
  end

  def you_shall_not_pass(value, limit)
    corrected_value = value - limit
    return corrected_value.to_i 
  end

  def find_cardinal_index_number
    case @actual_point
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