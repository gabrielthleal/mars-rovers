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
    cardinals = %w{N E S W}
     
    @y = y
    @x = x
    left_move = 1
    right_move = 1
    @actual_point = cardinal

    puts "Inicio #{@y} #{@x} #{@actual_point}"
    arr_move = move.split('') # lembrar de excluir tudo que não fore de acordo. ou tratar nos testes.

    arr_move.each do |mov|
      
      # cada movimento é o ponto cardinal atual 
      #  DEFINE A DIREÇÃO SEGUNDO OS PONTOS CARDINAIS
      if mov == 'L' 
        @actual_point = cardinals[-left_move] 
        left_move += 1
      elsif mov == 'R'
        @actual_point = cardinals[right_move]
        right_move += 1
      end 
      
      if mov == 'M'
        puts 'ME MOVI'
        @y += 1 if @actual_point == 'N'  
        @x += 1 if @actual_point == 'E'  
        @y -= 1 if @actual_point == 'S'  
        @x -= 1 if @actual_point == 'W'
      end
      
      @x -= you_shall_not_pass(@x, @limit_x) if @x > @limit_x
      @y -= you_shall_not_pass(@y, @limit_y) if @y > @limit_y 
      
      puts "Meio #{@x} #{@y} #{@actual_point}" 
    end
    puts "Final #{@x} #{@y} #{@actual_point}"
  end

  def you_shall_not_pass(value, limit)
    corrected_value = value - limit
    return corrected_value.to_i 
  end

  #def find_cardinal_index(@actual_point)
  #  case @actual_point
  #  when 'N'
  #    @left = 0 
  #    @right = 0
  #  when 'E'
  #    @left = 1
  #    @right = 1
  #  when 'S'
  #    @left = 2
  #    @right = 2
  #  when 'W'
  #    @left = 3 
  #    @right = 3
  #  else
  #    
  #  end
  #end 
end