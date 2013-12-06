class Cube

  attr_accessor :cube, :hist

  #New cubes are instantiated in a solved state with a clean history.
  def initialize
    @cube = [[0,0,0,0,0,0,0,0,0],[1,1,1,1,1,1,1,1,1],[2,2,2,2,2,2,2,2,2],[3,3,3,3,3,3,3,3,3],[4,4,4,4,4,4,4,4,4],[5,5,5,5,5,5,5,5,5]]
    @hist = []
  end

  #Removes any 4 of the same move in a row in @hist. Any move repeated four times ends the cube in the state it started in.
  def clean_hist
    i = 0
    until i == @hist.length
      if @hist[i] == @hist[i+1] && @hist[i] == @hist[i+2] && @hist[i] == @hist[i+3] 
        4.times {@hist.delete_at(i)}
        i = -1
      end
     i += 1
    end

    i = 0
    until i == @hist.length
      if @hist[i] == @hist[i+1] && @hist[i].length < 3
        @hist.delete_at(i)
        @hist[i] = "#{@hist[i]}2"
        i = -1
      end
     i += 1
    end

    @hist.join(', ')
  end 

  #Scrambles cube with 100 random moves and clears history
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

  #Turns left face clockwise
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
  #Turns left face counter-clockwise
  def lr
    3.times do 
      self.l
      @hist.pop
    end
    @hist << 'lr'
    self
  end
  #Turns left face twice
  def l2
    self.l.l
    @hist << 'l2'
    self
  end

  #Turns right face clockwise
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
  #Turns right face counter-clockwise
  def rr
    3.times do 
      self.r
      @hist.pop
    end
    @hist << "rr"
    self
  end
  #Turns right face twice
  def r2
    self.r.r
    @hist << 'r2'
    self
  end

  #Turns front face clockwise
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
  #Turns front face counter-clockwise
  def fr
    3.times do 
      self.f
      @hist.pop
    end
    @hist << "fr"
    self
  end
  #Turns front face twice
  def f2
    self.f.f
    @hist << 'f2'
    self
  end

  #Turns back face clockwise
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
  #Turns back face counter-clockwise
  def br
    3.times do 
      self.b
      @hist.pop
    end
    @hist << "br"
    self
  end
  #Turns back face twice
  def b2
    self.b.b
    @hist << 'b2'
    self
  end

  #Turns top face clockwise
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
  #turns top face counter-clockwise
  def ur
    3.times do 
      self.u
      @hist.pop
    end
    @hist << "ur"
    self
  end
  #turns top face twice
  def u2
    self.u.u
    @hist << 'u2'
    self
  end

  #Turns bottom face clockwise
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
  #Turns bottom face counter-clockwise

  def dr
    3.times do 
      self.d
      @hist.pop
    end
    @hist << "dr"
    self
  end
  #Turns bottom face twice

  def d2
    self.d.d
    @hist << 'l2'
    self
  end

  # Turns cube clockwise ONCE, like "u" but rest of cube moves too.
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

  #Turns cube over ONCE, like "fr" but rest of cube moves too.
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

  #Turns cube over TWICE, swapping top and bottom faces. Like "f2" but rest of cube moves too.
  def invert
    self.turn_over.turn_over
    @hist << "invert" 
    self
  end

  #Shuffles cross cubies on top, doesn't affect lower layers but does shuffle top corners.
  def cross_shuffle
     self.f.u.r.ur.rr.fr
    self
  end

  #Swaps [0][5] and [0][3]. Doesn't affect lower layers but does affect top corners.
  def cross_swap
    self.rr.u.u.r.u.rr.u.r.u
    self
  end

  #Shuffles top corners without affecting lower layers or top cross.
  def top_corner_shuffle
    self.rr.u.l.ur.r.u.lr.ur
    self
  end

  #Re-orients cubies of [0][4], [0][6], and [0][8] without affecting anything else.
  def last_move
    self.rr.d.d.r.f.d.d.fr.ur.f.d.d.fr.rr.d.d.r.u
    self
  end

end


