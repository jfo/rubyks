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
  attr_accessor :cube, :hist

#initialized stuff should include state of cube, auto scramble maybe? how many moves have been performed and in what order. 

  def initialize
    @cube = [[0,0,0,0,0,0,0,0,0],[1,1,1,1,1,1,1,1,1],[2,2,2,2,2,2,2,2,2],[3,3,3,3,3,3,3,3,3],[4,4,4,4,4,4,4,4,4],[5,5,5,5,5,5,5,5,5]]
    @hist = []
    self.scramble
  end

#blech so far on this one
#  def clean_hist
#    i = 0
#    @hist.each do |this|
#      if @hist[i..i+3].uniq.length == 1
#        4.times { @hist.delete(@hist[i])}
#        i -=1
#      end
#      i += 1
#    end
#  end 
#

  #basic motions, including turn and flip over
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
    @hist << 'l'
    self
  end
  def lr
    3.times do 
      self.l
      @hist.pop
    end
    @hist << 'lr'
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

    @hist << 'r'
    @cube = Marshal.load(Marshal.dump(cubetemp))
    self
  end
  def rr
    3.times do 
      self.r
      @hist.pop
    end
    @hist << "rr"
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

    @hist << 'f'
    @cube = Marshal.load(Marshal.dump(cubetemp))
    self
  end
  def fr
    3.times do 
      self.f
      @hist.pop
    end
    @hist << "fr"
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

    @hist << 'b'
    @cube = Marshal.load(Marshal.dump(cubetemp))
    self
  end
  def br
    3.times do 
      self.b
      @hist.pop
    end
    @hist << "br"
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

    @hist << 'u'
    @cube = Marshal.load(Marshal.dump(cubetemp))
    self  
  end
  def ur
    3.times do 
      self.u
      @hist.pop
    end
    @hist << "ur"
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

    @hist << 'd'
    @cube = Marshal.load(Marshal.dump(cubetemp))
    self
  end
  def dr
    3.times do 
      self.d
      @hist.pop
    end
    @hist << "dr"
    self
  end

 
  #cube orientation motions
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

    @hist << 'turn'
    @cube = cubetemp
    self
  end

  def turn_over 
    cubetemp = [[],[],[],[],[],[]]

    cubetemp[0][0] = @cube[3][0]
    cubetemp[0][1] = @cube[3][1]
    cubetemp[0][2] = @cube[3][2]
    cubetemp[0][3] = @cube[3][3]
    cubetemp[0][4] = @cube[3][4]
    cubetemp[0][5] = @cube[3][5]
    cubetemp[0][6] = @cube[3][6]
    cubetemp[0][7] = @cube[3][7]
    cubetemp[0][8] = @cube[3][8]

    cubetemp[1][0] = @cube[0][0]
    cubetemp[1][1] = @cube[0][1]
    cubetemp[1][2] = @cube[0][2]
    cubetemp[1][3] = @cube[0][3]
    cubetemp[1][4] = @cube[0][4]
    cubetemp[1][5] = @cube[0][5]
    cubetemp[1][6] = @cube[0][6]
    cubetemp[1][7] = @cube[0][7]
    cubetemp[1][8] = @cube[0][8]

    cubetemp[2][0] = @cube[2][0]
    cubetemp[2][1] = @cube[2][7]
    cubetemp[2][2] = @cube[2][8]
    cubetemp[2][3] = @cube[2][1]
    cubetemp[2][4] = @cube[2][2]
    cubetemp[2][5] = @cube[2][3]
    cubetemp[2][6] = @cube[2][4]
    cubetemp[2][7] = @cube[2][5]
    cubetemp[2][8] = @cube[2][6]

    cubetemp[3][0] = @cube[5][0]
    cubetemp[3][1] = @cube[5][5]
    cubetemp[3][2] = @cube[5][6]
    cubetemp[3][3] = @cube[5][7]
    cubetemp[3][4] = @cube[5][8]
    cubetemp[3][5] = @cube[5][1]
    cubetemp[3][6] = @cube[5][2]
    cubetemp[3][7] = @cube[5][3]
    cubetemp[3][8] = @cube[5][4]

    cubetemp[4][0] = @cube[4][0]
    cubetemp[4][1] = @cube[4][3]
    cubetemp[4][2] = @cube[4][4]
    cubetemp[4][3] = @cube[4][5]
    cubetemp[4][4] = @cube[4][6]
    cubetemp[4][5] = @cube[4][7]
    cubetemp[4][6] = @cube[4][8]
    cubetemp[4][7] = @cube[4][1]
    cubetemp[4][8] = @cube[4][2]

    cubetemp[5][0] = @cube[1][0]
    cubetemp[5][1] = @cube[1][5]
    cubetemp[5][2] = @cube[1][6]
    cubetemp[5][3] = @cube[1][7]
    cubetemp[5][4] = @cube[1][8]
    cubetemp[5][5] = @cube[1][1]
    cubetemp[5][6] = @cube[1][2]
    cubetemp[5][7] = @cube[1][3]
    cubetemp[5][8] = @cube[1][4]

    @cube = cubetemp
    self
  end

  def invert
    self.turn_over.turn_over
    @hist << "invert" 
    self
  end


  #first layer moves
  def cross_solve 
    downcross = []
    i = 1
    until @cube[0][1] == 0 && @cube[0][3] == 0 && @cube[0][5] == 0 && @cube[0][7] == 0
         
      until downcross.include?(0) 
         downcross = []
         self.rr.d.r.l.dr.lr.turn
         downcross = [@cube[5][1],@cube[5][3],@cube[5][5], @cube[5][7]]
         i += 1
         if i > 10
           self.turn until @cube[0][1] != 0
           self.l.b 
           i = 1
         end
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

    until @cube[4][3] == @cube[4][0] && @cube[1][5] == @cube[1][0]
      until @cube[1][5] == @cube[1][0]        
        self.u
      end
      self.turn if @cube[4][3] != @cube[4][0]
      i += 1

      if i > 10   
        self.cross_swap
        i = 1
      end
    end


    if @cube[2][7] != @cube[2][0]
      self.cross_swap
    end

    self
  end

  def corners_solve
    corners = []

    i = 1

    until @cube[0].uniq == [0] && @cube[1][4] == @cube[1][0] && @cube[2][6] == @cube[2][0] && @cube[3][2] == @cube[3][0] && @cube[4][2] == @cube[4][0]

      corners = [@cube[1][8],@cube[1][2],@cube[2][4],@cube[2][2],@cube[3][4],@cube[3][6],@cube[4][6],@cube[4][8]]
      until corners.include?(0)
        self.rr.d.r.turn
        corners = [@cube[1][8],@cube[1][2],@cube[2][4],@cube[2][2],@cube[3][4],@cube[3][6],@cube[4][6],@cube[4][8]]
      end
      
      until @cube[3][6] == 0 || @cube[4][6] == 0
        self.d
      end

      if @cube[3][6] == 0
        self.d.turn until @cube[5][4] == @cube[3][0]
        self.rr.dr.r
      end

      if @cube[4][6] == 0
        self.d.turn until @cube[5][4] == @cube[4][0]
        self.f.d.fr
      end
      i += 1
      self.turn

      if i > 50
        self.u until @cube[0][6] != 0
        self.d until @cube[5][4] == 0
        self.lr.d.l
        self.u until @cube[1][5] == @cube[1][0]
        i = 1
      end
    end
    self
  end

  #second layer move
  def second_layer_solve
    self.invert
    mids = []

  #  until @cube[1][3] == @cube[1][0] && @cube[1][7] == @cube[1][0] && @cube[2][1] == @cube[2][0] && @cube[2][5] == @cube[2][0] && @cube[3][3] == @cube[3][0] && @cube[3][7] ==@cube[3][0] && @cube[4][1] == @cube[4][0] && @cube[4][5] == @cube[4][0]

    until mids.include?(5) == false && @cube[1][7] == @cube[1][0] && @cube[1][3] == @cube[1][0] && @cube[3][3] == @cube[3][0] && @cube[3][7] == @cube[3][0] && @cube[2][1] == @cube[2][0] && @cube[2][5] == @cube[2][0] && @cube[4][1] == @cube[4][0] && @cube[4][5] == @cube[4][0]

      until @cube[4][5] == @cube[4][0] && @cube[3][7] == @cube[3][0]
      i = 0

        until @cube[4][3] != 5 && @cube[0][7] != 5
          self.u
          i += 1

          if i > 50
            self.cross_swap
            self.u.r.ur.rr.ur.fr.u.f
            i = 1
          end
        end

        until @cube[4][3] == @cube[4][0]
          self.ur.turn
        end

        if @cube[0][7] != @cube[3][0]
          self.cross_swap
        end
        self.u.r.ur.rr.ur.fr.u.f
      end
      self.turn
      mids = [@cube[1][3],@cube[1][7],@cube[2][1],@cube[2][5],@cube[3][3],@cube[3][7],@cube[4][1],@cube[4][5]]
    end


    self
  end

  #last layer moves
  def top_cross
    topcross = [@cube[0][1],@cube[0][3],@cube[0][5],@cube[0][7]]
    i = 1
    bigi = 0
    until topcross.count(5) >= 2
      self.cross_shuffle
      bigi += 1
      i += 1

      if i > 15
        self.turn
        i = 1
      end

      if bigi > 100
        puts "derp"
        p topcross
      gets
      end
    topcross = [@cube[0][1],@cube[0][3],@cube[0][5],@cube[0][7]]
    end

    if (topcross[0] == 5 && topcross[2] == 5) || (topcross[1] == 5 && topcross[3] == 5)
      self.turn until @cube[0][7] == @cube[0][0] 
      self.cross_swap
    end
    
    self.turn until @cube[0][1] == @cube[0][0] && @cube[0][3] == @cube[0][0]

    i = 1
    until topcross.uniq == [5]
      self.cross_shuffle

      if i > 20
        self.turn
      end
      topcross = [@cube[0][1],@cube[0][3],@cube[0][5],@cube[0][7]]
    end
    i = 1
    until @cube[1][5] == @cube[1][0] && @cube[4][3] == @cube[4][0]
      self.u
      i += 1
      if i >17 
        self.cross_swap.turn.cross_swap
        i = 1
      end
    end
    self.cross_swap if @cube[3][1] != @cube[3][0]
    self
  end

  def top_corners
    stay_corner = [@cube[0][2], @cube[1][4],@cube[2][8]]
    i = 1

    until stay_corner.sort == [@cube[1][0],@cube[2][0],@cube[0][0]].sort
      self.turn
      stay_corner = [@cube[0][2], @cube[1][4],@cube[2][8]]
      i += 1

      if i > 4
        self.top_corner_shuffle
        i = 0
        stay_corner = [@cube[0][2], @cube[1][4],@cube[2][8]]
      end
    end
    
    until @cube[0][2] == @cube[0][0]
      self.turn.turn.last_move.turn.turn
    end

    stay4 = [@cube[0][4], @cube[2][6],@cube[3][2]]
    until stay4.sort == [@cube[2][0],@cube[3][0],@cube[0][0]].sort
      
    self.top_corner_shuffle
      stay4 = [@cube[0][4], @cube[2][6],@cube[3][2]]
    end

    self.turn.last_move.turn.turn.turn until @cube[0][4] == @cube[0][0]

    if @cube[0][4] == @cube[0][0] && @cube[0][6] != @cube[0][0]
      i = 1

      until @cube.sort == [[0,0,0,0,0,0,0,0,0],[1,1,1,1,1,1,1,1,1],[2,2,2,2,2,2,2,2,2],[3,3,3,3,3,3,3,3,3],[4,4,4,4,4,4,4,4,4],[5,5,5,5,5,5,5,5,5]]

      self.last_move
      i += 1
      if i > 100
        self.colorize.print
        gets
        i = 1
      end
      end
    end
  end

  def cross_shuffle
    self.f.u.r.ur.rr.fr
    self
  end

  def cross_swap
    self.rr.u.u.r.u.rr.u.r.u
    self
  end

  def top_corner_shuffle
    self.rr.u.l.ur.r.u.lr.ur
    self
  end


  def last_move
    self.rr.d.d.r.f.d.d.fr.ur.f.d.d.fr.rr.d.d.r.u
    self
  end


# cube methods and UI 

  def solve
    self.cross_solve.corners_solve.second_layer_solve.top_cross.top_corners
    turn until @cube[1][0] == 1
    self.invert
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
    @hist = []
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

  def colorize
    @cube.each do |this|
      this.collect! do |num|
        if num ==1
          num = num.to_s.orange
        elsif num == 2
          num = num.to_s.yellow
        elsif num ==3
          num = num.to_s.red
        elsif num == 4
          num = num.to_s.green
        elsif num ==5 
          num = num.to_s.blue
        else
          num = num
        end
      end
    end
    self
  end

  def print
    self
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
  self
end



# i
x = Cube.new
x.solve
p x.hist.join(', ')
puts x.hist.length
x.clean_hist
puts "new"
p x.hist.join(', ')

puts x.hist.length






#loop do
#x = Cube.new
#x.scramble
#x.print
#sleep(1)
#x.cross_solve
#x.print
#sleep(1)
#x.corners_solve
#x.print
#sleep(1)
#x.second_layer_solve
#x.invert.print
#x.invert
#sleep(1)
#x.top_cross
#x.invert.print
#x.invert
#
#sleep(1)
#x.top_corners
#x.invert.print
#x.invert
#sleep(1)
#x.invert.colorize.print
#sleep(1)
#end
##
#average = []
#
#i = 1
#1000.times do
#y =Time.now
#x = Cube.new
##system("clear")
#x.scramble
#x.solve
##x.colorize
##x.print
#length = Time.now - y
#
#average << length
#puts i
#i+=1
#puts average.inject(:+) / average.length
#
#puts Time.now
#end
#puts average
