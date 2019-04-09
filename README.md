# PROBLEM: MARS ROVERS

A squad of robotic rovers is to be landed by NASA on a plateau on Mars. This
plateau, which is curiously rectangular, must be navigated by the rovers so that their onboard
cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover's position and the location is represented by a combination of x and y coordinates
and a letter representing one of the four cardinal compass points. The plateau is divided up into
a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in
the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible
letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees left or right respectively,
without moving from its current spot. 'M' means move forward one grid point, and maintain the
same heading.

Assume that the square directly North from (x, y) is (x, y+1).

# INPUT:
The first line of input is the upper-right coordinates of the plateau, the lower-left
coordinates are assumed to be 0,0.

The rest of the input is information pertaining to the rovers that have been deployed.
Each rover has two lines of input. The first line gives the rover's position, and the second line is
a series of instructions telling the rover how to explore the plateau.

The position is made up of two integers and a letter separated by spaces, corresponding
to the x and y coordinates and the rover's orientation.

Each rover will be finished sequentially, which means that the second rover won't
start to move until the first one has finished moving

# OUTPUT:

The output for each rover should be its final coordinates and heading.

Test Input:
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
Expected Output:
1 3 N
5 1 E

#Instruções
1 - gem install rspec
2 - a partir da raíz da pasta só rodar os testes com: rspec spec/lib/rover_spec.rb

#Explicando o que foi feito

1 -Aqui eu defino uma constante com os pontos carninais e inicializo os limites de x e y  

CARDINAL_LETTERS = %w[N E S W].freeze
  attr_accessor :limit_x
  attr_accessor :limit_y

  def initialize(x, y)
    @limit_x = x.to_i
    @limit_y = y.to_i
  end 

  2 - Nesse método eu defino os valores que dirão a posição inicial e sua movimentação, fora a chamada dos métodos 
  que vão realizar, de fato, toda a movimentação:

   def run_walle_run(x, y, cardinal_position, action)

2.1 - esse each percorre a string de movimentação contida em 'action' letra por letra:
  permitindo que eu use os movimentos nas suas respectivas ordens

    action.each_char do |mov| 


  3 - Esse método recebe a direção que o rover vai girar 'L' ou 'R' e retorna o ponto cardinal 
      que ele se encontra após virar: 'N', 'E', 'S' ou 'W'.

    Eu acesso o ponto cardinal na constante da seguinte forma:
    Se ele vira pra esquerda ('L') então fica: 
    CARDINAL_LETTERS[o index da posição atual -1]
    se for a direita('R') então é CARDINAL_LETTERS[o index da posição atual + 1]
    (no caso da direita eu tive um problema quando o index tinha que ser zero. então tratei com um ternário)

  def which_side(side)
    raise 'invalid value' unless %W[L R M].include?(side.to_s.upcase)
    if side == 'L' 
      CARDINAL_LETTERS[find_cardinal_index - 1] 
    elsif side == 'R'
      CARDINAL_LETTERS[@cardinal_position == 'W' ? 0 : find_cardinal_index + 1]
    end 
  end
  
 4 - Esse método recebe a ação de movimento ('M') e pra qual ponto cardinal ele está olhando.

    caso ele esteja olhando 'N' ou 'W' então ele se move em X
    caso estela 'E' ou 'S' então se move em Y
 
  def move_foward(step, looking_at)
    if step == 'M'
      @y += 1 if looking_at == 'N'  
      @x += 1 if looking_at == 'E'  
      @y -= 1 if looking_at == 'S'  
      @x -= 1 if looking_at == 'W'
    end
    {x: @x, y: @y}
  end

private

5 - Aqui ele evita que o rover passe do limite estipulado.
eu pego o limite menos o valor atual de x ou y e decremento em x ou y   
  def you_shall_not_pass
    @x -= (@x - @limit_x)
    @y -= (@y - @limit_y)
  end

6 - Controla a posição cardinal, não deixando ela ficar nula em algum momento.
  se só houver ações de movimento nos comandos, então ele se move na direção em que foi implantado.

  def actual_cardinal_position(actual_position) 
    if actual_position.nil?
      @cardinal_position
    else
      actual_position
    end
  end
7 - e finalmente, aqui eu encontro o index (valor inteiro) do ponto cardeal atual e retorno pro metodo que gira o rover.

  def find_cardinal_index
    CARDINAL_LETTERS.index(@cardinal_position)
  end 
end