class String
  #colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue 
    colorize(34)
  end

  def orange 
    colorize(36)
  end

end

class Cube
  attr_accessor :cube, :base

  def initialize
    white = [0,0,0,0,0,0,0,0,0]
    orange = [1,1,1,1,1,1,1,1,1]
    yellow = [2,2,2,2,2,2,2,2,2]
    red = [3,3,3,3,3,3,3,3,3]
    green= [4,4,4,4,4,4,4,4,4]
    blue = [5,5,5,5,5,5,5,5,5]

    @cube = [white,orange,yellow,red,green,blue]
    @base = Marshal.load(Marshal.dump(@cube))

    @cube[4].map! {|color| color.to_s.green}
    @cube[3].map! {|color| color.to_s.red}
    @cube[2].map! {|color| color.to_s.yellow}
    @cube[5].map! {|color| color.to_s.blue}
    @cube[1].map! {|color| color.to_s.orange}
  end

  def invert
    cubetemp = []
    cubetemp[0] = @cube[5].reverse
    cubetemp[1] = @cube[4]
    cubetemp[2] = @cube[3]
    cubetemp[3] = @cube[2]
    cubetemp[4] = @cube[1]
    cubetemp[5] = @cube[0].reverse
    @cube = cubetemp
  end

  def turn 
    cubetemp = [[],[],[],[],[],[]]

    cubetemp[0][0] = @cube[0][0]
    cubetemp[0][1] = @cube[0][7]
    cubetemp[0][2] = @cube[0][8]
    cubetemp[0][3] = @cube[0][1]
    cubetemp[0][4] = @cube[0][2]
    cubetemp[0][5] = @cube[0][3]
    cubetemp[0][6] = @cube[0][4]
    cubetemp[0][7] = @cube[0][5]
    cubetemp[0][8] = @cube[0][6]

    cubetemp[1][0] = @cube[4][0]
    cubetemp[1][1] = @cube[4][7]
    cubetemp[1][2] = @cube[4][8]
    cubetemp[1][3] = @cube[4][1]
    cubetemp[1][4] = @cube[4][2]
    cubetemp[1][5] = @cube[4][3]
    cubetemp[1][6] = @cube[4][4]
    cubetemp[1][7] = @cube[4][5]
    cubetemp[1][8] = @cube[4][6]

    cubetemp[2][0] = @cube[1][0]
    cubetemp[2][1] = @cube[1][7]
    cubetemp[2][2] = @cube[1][8]
    cubetemp[2][3] = @cube[1][1]
    cubetemp[2][4] = @cube[1][2]
    cubetemp[2][5] = @cube[1][3]
    cubetemp[2][6] = @cube[1][4]
    cubetemp[2][7] = @cube[1][5]
    cubetemp[2][8] = @cube[1][6]

    cubetemp[3][0] = @cube[2][0]
    cubetemp[3][1] = @cube[2][7]
    cubetemp[3][2] = @cube[2][8]
    cubetemp[3][3] = @cube[2][1]
    cubetemp[3][4] = @cube[2][2]
    cubetemp[3][5] = @cube[2][3]
    cubetemp[3][6] = @cube[2][4]
    cubetemp[3][7] = @cube[2][5]
    cubetemp[3][8] = @cube[2][6]

    cubetemp[4][0] = @cube[3][0]
    cubetemp[4][1] = @cube[3][7]
    cubetemp[4][2] = @cube[3][8]
    cubetemp[4][3] = @cube[3][1]
    cubetemp[4][4] = @cube[3][2]
    cubetemp[4][5] = @cube[3][3]
    cubetemp[4][6] = @cube[3][4]
    cubetemp[4][7] = @cube[3][5]
    cubetemp[4][8] = @cube[3][6]

    cubetemp[5][0] = @cube[5][0]
    cubetemp[5][1] = @cube[5][3]
    cubetemp[5][2] = @cube[5][4]
    cubetemp[5][3] = @cube[5][5]
    cubetemp[5][4] = @cube[5][6]
    cubetemp[5][5] = @cube[5][7]
    cubetemp[5][6] = @cube[5][8]
    cubetemp[5][7] = @cube[5][1]
    cubetemp[5][8] = @cube[5][2]

    @cube = cubetemp
    self
  end

  def cross_swap
      self.rr.u.u.r.u.rr.u.r.u.print
  end

  def cross_solve 
    downcross = []
    until @cube[0][1] == 0 && @cube[0][3] == 0 && @cube[0][5] == 0 && @cube[0][7] == 0
         
      until downcross.include?(0) 
         downcross = []
         self.rr.d.r.l.dr.lr.turn
         downcross = [@cube[5][1],@cube[5][3],@cube[5][5], @cube[5][7]]
         puts "first"
      end
       until @cube[5][3] == 0
        self.d
      end
      until @cube[0][7] != 0
        self.u
      end
     self.f.f
     downcross = []
    end
self.print
    


  end

  def l
    cubetemp = Marshal.load(Marshal.dump(@cube))

    cubetemp[0][1] = @cube[2][1]
    cubetemp[0][2] = @cube[2][2]
    cubetemp[0][8] = @cube[2][8]

    cubetemp[2][1] = @cube[5][1]
    cubetemp[2][2] = @cube[5][2]
    cubetemp[2][8] = @cube[5][8]

    cubetemp[5][1] = @cube[4][1]
    cubetemp[5][2] = @cube[4][2]
    cubetemp[5][8] = @cube[4][8]

    cubetemp[4][1] = @cube[0][1]
    cubetemp[4][2] = @cube[0][2]
    cubetemp[4][8] = @cube[0][8]



    cubetemp[1][1] = @cube[1][7]
    cubetemp[1][2] = @cube[1][8]
    cubetemp[1][3] = @cube[1][1]
    cubetemp[1][4] = @cube[1][2]
    cubetemp[1][5] = @cube[1][3]
    cubetemp[1][6] = @cube[1][4]
    cubetemp[1][7] = @cube[1][5]
    cubetemp[1][8] = @cube[1][6]

    @cube = Marshal.load(Marshal.dump(cubetemp))
    self
  end

  def lr
    3.times do 
      self.l
    end
    self
  end

  def r
    cubetemp = Marshal.load(Marshal.dump(@cube))

    cubetemp[0][4] = @cube[4][4]
    cubetemp[0][5] = @cube[4][5]
    cubetemp[0][6] = @cube[4][6]

    cubetemp[4][4] = @cube[5][4]
    cubetemp[4][5] = @cube[5][5]
    cubetemp[4][6] = @cube[5][6]

    cubetemp[5][4] = @cube[2][4]
    cubetemp[5][5] = @cube[2][5]
    cubetemp[5][6] = @cube[2][6]

    cubetemp[2][4] = @cube[0][4]
    cubetemp[2][5] = @cube[0][5]
    cubetemp[2][6] = @cube[0][6]

    cubetemp[3][1] = @cube[3][7]
    cubetemp[3][2] = @cube[3][8]
    cubetemp[3][3] = @cube[3][1]
    cubetemp[3][4] = @cube[3][2]
    cubetemp[3][5] = @cube[3][3]
    cubetemp[3][6] = @cube[3][4]
    cubetemp[3][7] = @cube[3][5]
    cubetemp[3][8] = @cube[3][6]

    @cube = Marshal.load(Marshal.dump(cubetemp))
    self
  end

  def rr
    3.times do 
      self.r
    end
    self
  end

  def f
    cubetemp = Marshal.load(Marshal.dump(@cube))

    cubetemp[0][6] = @cube[1][6]
    cubetemp[0][7] = @cube[1][7]
    cubetemp[0][8] = @cube[1][8]

    cubetemp[1][6] = @cube[5][2]
    cubetemp[1][7] = @cube[5][3]
    cubetemp[1][8] = @cube[5][4]

    cubetemp[5][2] = @cube[3][6]
    cubetemp[5][3] = @cube[3][7]
    cubetemp[5][4] = @cube[3][8]

    cubetemp[3][8] = @cube[0][8]
    cubetemp[3][7] = @cube[0][7]
    cubetemp[3][6] = @cube[0][6]

    cubetemp[4][1] = @cube[4][7]
    cubetemp[4][2] = @cube[4][8]
    cubetemp[4][3] = @cube[4][1]
    cubetemp[4][4] = @cube[4][2]
    cubetemp[4][5] = @cube[4][3]
    cubetemp[4][6] = @cube[4][4]
    cubetemp[4][7] = @cube[4][5]
    cubetemp[4][8] = @cube[4][6]

    @cube = Marshal.load(Marshal.dump(cubetemp))
    self
  end

  def fr
    3.times do 
      self.f
    end
    self
  end

  def b
    cubetemp = Marshal.load(Marshal.dump(@cube))

    cubetemp[0][2] = @cube[3][2]
    cubetemp[0][3] = @cube[3][3]
    cubetemp[0][4] = @cube[3][4]

    cubetemp[1][2] = @cube[0][2]
    cubetemp[1][3] = @cube[0][3]
    cubetemp[1][4] = @cube[0][4]

    cubetemp[3][2] = @cube[5][6]
    cubetemp[3][3] = @cube[5][7]
    cubetemp[3][4] = @cube[5][8]

    cubetemp[5][6] = @cube[1][2]
    cubetemp[5][7] = @cube[1][3]
    cubetemp[5][8] = @cube[1][4]



    cubetemp[2][1] = @cube[2][7]
    cubetemp[2][2] = @cube[2][8]
    cubetemp[2][3] = @cube[2][1]
    cubetemp[2][4] = @cube[2][2]
    cubetemp[2][5] = @cube[2][3]
    cubetemp[2][6] = @cube[2][4]
    cubetemp[2][7] = @cube[2][5]
    cubetemp[2][8] = @cube[2][6]

    @cube = Marshal.load(Marshal.dump(cubetemp))
    self
  end

  def br
    3.times do 
      self.b
    end
    self
  end

  def u
    cubetemp = Marshal.load(Marshal.dump(@cube))

    cubetemp[1][4] = @cube[4][2]
    cubetemp[1][5] = @cube[4][3]
    cubetemp[1][6] = @cube[4][4]

    cubetemp[4][2] = @cube[3][8]
    cubetemp[4][3] = @cube[3][1]
    cubetemp[4][4] = @cube[3][2]

    cubetemp[3][8] = @cube[2][6]
    cubetemp[3][1] = @cube[2][7]
    cubetemp[3][2] = @cube[2][8]

    cubetemp[2][6] = @cube[1][4]
    cubetemp[2][7] = @cube[1][5]
    cubetemp[2][8] = @cube[1][6]

    cubetemp[0][1] = @cube[0][7]
    cubetemp[0][2] = @cube[0][8]
    cubetemp[0][3] = @cube[0][1]
    cubetemp[0][4] = @cube[0][2]
    cubetemp[0][5] = @cube[0][3]
    cubetemp[0][6] = @cube[0][4]
    cubetemp[0][7] = @cube[0][5]
    cubetemp[0][8] = @cube[0][6]

    @cube = Marshal.load(Marshal.dump(cubetemp))
    self  
  end

  def ur
    3.times do 
      self.u
    end
    self
  end

  def d
    cubetemp = Marshal.load(Marshal.dump(@cube))

    cubetemp[1][8] = @cube[2][2]
    cubetemp[1][1] = @cube[2][3]
    cubetemp[1][2] = @cube[2][4]

    cubetemp[2][2] = @cube[3][4]
    cubetemp[2][3] = @cube[3][5]
    cubetemp[2][4] = @cube[3][6]

    cubetemp[3][4] = @cube[4][6]
    cubetemp[3][5] = @cube[4][7]
    cubetemp[3][6] = @cube[4][8]

    cubetemp[4][6] = @cube[1][8]
    cubetemp[4][7] = @cube[1][1]
    cubetemp[4][8] = @cube[1][2]

    cubetemp[5][1] = @cube[5][7]
    cubetemp[5][2] = @cube[5][8]
    cubetemp[5][3] = @cube[5][1]
    cubetemp[5][4] = @cube[5][2]
    cubetemp[5][5] = @cube[5][3]
    cubetemp[5][6] = @cube[5][4]
    cubetemp[5][7] = @cube[5][5]
    cubetemp[5][8] = @cube[5][6]

    @cube = Marshal.load(Marshal.dump(cubetemp))
    self
  end

  def dr
    3.times do 
      self.d
    end
    self
  end

  def scramble
    100.times do 
      turn = rand(5)
      self.l if turn == 0
      self.r if turn == 1
      self.u if turn == 2
      self.d if turn == 3
      self.f if turn == 4
      self.b if turn == 5
    end
    self 
  end

  def show
    p @cube[0]
    p @cube[1]
    p @cube[2]
    p @cube[3]
    p @cube[4]
    p @cube[5]
  end

  def print
    puts "                    ---------"
    puts "                    |#{@cube[1][8]}||#{@cube[1][1]}||#{@cube[1][2]}|"
    puts "                    ---------"
    puts "                    |#{@cube[1][7]}||#{@cube[1][0]}||#{@cube[1][3]}|"
    puts "                    ---------"
    puts "                    |#{@cube[1][6]}||#{@cube[1][5]}||#{@cube[1][4]}|"
    puts "                    ---------"
    puts "--------- --------- --------- ---------"
    puts "|#{@cube[5][8]}||#{@cube[5][1]}||#{@cube[5][2]}| |#{@cube[4][8]}||#{@cube[4][1]}||#{@cube[4][2]}| |#{@cube[0][8]}||#{@cube[0][1]}||#{@cube[0][2]}| |#{@cube[2][8]}||#{@cube[2][1]}||#{@cube[2][2]}|"
    puts "--------- --------- --------- ---------"
    puts "|#{@cube[5][7]}||#{@cube[5][0]}||#{@cube[5][3]}| |#{@cube[4][7]}||#{@cube[4][0]}||#{@cube[4][3]}| |#{@cube[0][7]}||#{@cube[0][0]}||#{@cube[0][3]}| |#{@cube[2][7]}||#{@cube[2][0]}||#{@cube[2][3]}|"
    puts "--------- --------- --------- ---------"
    puts "|#{@cube[5][6]}||#{@cube[5][5]}||#{@cube[5][4]}| |#{@cube[4][6]}||#{@cube[4][5]}||#{@cube[4][4]}| |#{@cube[0][6]}||#{@cube[0][5]}||#{@cube[0][4]}| |#{@cube[2][6]}||#{@cube[2][5]}||#{@cube[2][4]}|"
    puts "--------- --------- --------- ---------"
    puts "                    ---------"
    puts "                    |#{@cube[3][8]}||#{@cube[3][1]}||#{@cube[3][2]}|"
    puts "                    ---------"
    puts "                    |#{@cube[3][7]}||#{@cube[3][0]}||#{@cube[3][3]}|"
    puts "                    ---------"
    puts "                    |#{@cube[3][6]}||#{@cube[3][5]}||#{@cube[3][4]}|"
    puts "                    ---------"
  end
end

x = Cube.new
x.scramble

x.cross_solve
