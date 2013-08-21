require_relative "rubyks"

system ("clear")

5.times {puts}
puts "   Hi, this is a model of a Rubiks Cube. It's called the Rubyks Cube.  LOL."
puts
puts "   You can use regular Rubiks nomenclature to make a move; enter 'help' to see a list of commands."
gets
system ("clear")
5.times {puts}

x = Cube.new
moves = []


loop do

system ("clear")
5.times {puts}
x.colorize.print
puts
print x.hist.join(", ")
puts
puts "What move?"

move = gets.chomp


moves << move
x.scramble if move == "scramble"
x.simple_solve if move == "solve"
x.invert if move == "invert"
x.cross if move == "cross"

x = Cube.new if move == "reset"
moves = [] if move == "reset" || move == "scramble"

if move == "."
  moves.pop
  move = moves[-1]
  moves << move
end

if move == ","
  moves.pop
  move ="#{moves.pop}'"
end

if move == "help"
  system ("clear")
  puts "This program accepts regular Rubiks nomenclature. You can turn the cube in one of six basic ways:"
  puts
  puts "  u - turns the top (u for up) clockwise."
  puts "  d - turns the bottom (d for down) clockwise."
  puts "  r - turns the right side clockwise."
  puts "  l - turns the left side clockwise."
  puts "  b - turns the back side clockwise."
  puts "  f - turns the front side clockwise."
  puts
  puts "Any of these moves can be reversed by appending an apostrophe to their letter (')."
  puts 
  puts "The cube starts solved. the faces are represented like so:"
  puts "  0 is the top"
  puts "  1 is the left side"
  puts "  2 is the back"
  puts "  3 is the right side"
  puts "  4 is the front"
  puts "  5 is the bottom"
  puts
  puts "Try visualizing the cube folded together."
  puts 
  puts "Here are some additional commands:"
  puts
  puts "  reset - starts the cube from base case"
  puts "  scramble - scrambles the cube randomly"
  puts "  , - undoes the last move"
  puts "  . - Vimtastically repeats the last move you made"
  puts "  solve - solves the cube" 
  puts "  <CTRL-c> - to quit"
  puts
  puts "Press Enter to continue..."

  moves.pop
  gets
end


x.u if move == "u" || move =="u''"
x.d if move == "d" || move =="d''"
x.f if move == "f" || move =="f''"
x.b if move == "b" || move =="b''"
x.r if move == "r" || move =="r''"
x.l if move == "l" || move =="l''"

x.ur if move == "u'"
x.dr if move == "d'"
x.fr if move == "f'"
x.br if move == "b'"
x.rr if move == "r'"
x.lr if move == "l'"

end




