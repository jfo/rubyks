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
      move = [:l, :r, :u, :d, :f, :b].sample
      self.send(move)
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

  #Solves for cross on first layer. Affects all other layers. 
  def cross_solve 
    downcross = []
    i = 1
    until @cube[0][1] == @cube[0][0] && @cube[0][3] == @cube[0][0]  && @cube[0][5] == @cube[0][0] && @cube[0][7] == @cube[0][0]
         
      until downcross.include?(@cube[0][0]) 
         downcross = []
         self.rr.d.r.l.dr.lr.turn
         downcross = [@cube[5][1],@cube[5][3],@cube[5][5], @cube[5][7]]
         i += 1
         if i > 10
           self.turn until @cube[0][1] != @cube[0][0] 
           self.l.b 
           i = 1
         end
      end

      until @cube[5][3] == cube[0][0]
        i =0
        self.d

        if i > 59 
          self.print
          gets
          end
          i+=1
      end

      until @cube[0][7] != @cube[0][0]
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

  #Solves for corners on first layer without affecting first layer cross.
  def corners_solve
    corners = []

    i = 1

    until @cube[0].uniq == [@cube[0][0]] && @cube[1][4] == @cube[1][0] && @cube[2][6] == @cube[2][0] && @cube[3][2] == @cube[3][0] && @cube[4][2] == @cube[4][0]

      corners = [@cube[1][8],@cube[1][2],@cube[2][4],@cube[2][2],@cube[3][4],@cube[3][6],@cube[4][6],@cube[4][8]]
      until corners.include?(0)
        self.rr.d.r.turn
        corners = [@cube[1][8],@cube[1][2],@cube[2][4],@cube[2][2],@cube[3][4],@cube[3][6],@cube[4][6],@cube[4][8]]
      end
      
      until @cube[3][6] == @cube[0][0] || @cube[4][6] == @cube[0][0] 
        self.d
      end

      if @cube[3][6] == @cube[0][0]
        self.d.turn until @cube[5][4] == @cube[3][0]
        self.rr.dr.r
      end

      if @cube[4][6] == @cube[0][0]
        self.d.turn until @cube[5][4] == @cube[4][0]
        self.f.d.fr
      end
      i += 1
      self.turn

      if i > 50
        self.u until @cube[0][6] != @cube[0][0]
        self.d until @cube[5][4] == @cube[0][0]
        self.lr.d.l
        self.u until @cube[1][5] == @cube[1][0]
        i = 1
      end
    end
    self
  end

  #Solves for middle layer when first layer is solved without affecting first layer.
  def second_layer_solve
    self.invert
    mids = []
    x = @cube[0][0]

    until mids.include?(x) == false && @cube[1][7] == @cube[1][0] && @cube[1][3] == @cube[1][0] && @cube[3][3] == @cube[3][0] && @cube[3][7] == @cube[3][0] && @cube[2][1] == @cube[2][0] && @cube[2][5] == @cube[2][0] && @cube[4][1] == @cube[4][0] && @cube[4][5] == @cube[4][0]

      until @cube[4][5] == @cube[4][0] && @cube[3][7] == @cube[3][0]
      i = 0

        until @cube[4][3] != @cube[0][0] && @cube[0][7] != @cube[0][0] 
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

  #Solves for last layer cross when first two layers are completed
  def top_cross
     topcross = [@cube[0][1],@cube[0][3],@cube[0][5],@cube[0][7]]
    i = 1
    bigi = 0
    until topcross.count(@cube[0][0]) >= 2
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

    if (topcross[0] == @cube[0][0] && topcross[2] == @cube[0][0]) || (topcross[1] == @cube[0][0] && topcross[3] == @cube[0][0])
      self.turn until @cube[0][7] == @cube[0][0] 
      self.cross_swap
    end
    
    self.turn until @cube[0][1] == @cube[0][0] && @cube[0][3] == @cube[0][0]

    i = 1
    until topcross.uniq == [@cube[0][0]]
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

  #Solves last layer corners when all other layers and cross have been completed.
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


      testarray = [] 
      until testarray.flatten.uniq.length == 6

        @cube.each {|side| testarray << side.uniq}

        self.last_move
        i += 1
        if i > 100
          i = 1
        end
      end
    end

    if @cube[0][6] != @cube[0][0]
      self.last_move
    end
  end

  #solve invokes all layer solving methods in sequence, solving from any legal state 
  def simple_solve
    testarray = [] 
    @cube.each {|side| testarray << side.uniq}
    return self if testarray.flatten.length == 6

    self.cross_solve.corners_solve.second_layer_solve.top_cross.top_corners
    self.clean_hist
    self.invert
    self
  end

  #outputs each side as an array on its own line
  def show
    p @cube[0]
    p @cube[1]
    p @cube[2]
    p @cube[3]
    p @cube[4]
    p @cube[5]
  end

  #Colorizes integers for output to terminal. 
  def colorize
    @cube.each do |this|
      this.collect! do |num|
        if num == 1
          num = "\e[36m#{num}\e[0m"
        elsif num == 2
          num = "\e[33m#{num}\e[0m"
        elsif num ==3
          num = "\e[31m#{num}\e[0m"
        elsif num == 4
          num = "\e[32m#{num}\e[0m"
        elsif num ==5 
          num = "\e[34m#{num}\e[0m"
        else
          num = num
        end
      end
    end
    self
  end

  #Converts colorized cube back to integers
  def decolorize
    if @cube.flatten.include?(5) == false
      @cube.each do |this|
        this.collect! do |num|
          if num == 0
            num = num
          else
            num = num.gsub(/[^\d]/, '')[2].to_i if num.class == String
          end
        end
      end
    end
  end

  def print_square(side)
    rows = [[8, 1, 2], [7, 0, 3], [6, 5, 4]]
     
    rows.map do |row|
      row.map { |pos| "|#{@cube[side][pos]}|" }.join
    end
  end

  def print_side(side)
    line_break = "---------"
    line_array = (0..3).map { |x| line_break } 

    side_array = print_square(side)
    
    side_array = [line_break] +  side_array.zip(line_array).flatten
    
    if [1, 3].include?(side)
      spaces = (0...20).map { |x| " "}.join
      side_array = side_array.map {|item| spaces + item}
    end

    side_array
  end

  #Outputs an ascii representation of the cube arrays
  def print
    sides = []
    sides << print_side(1)
    sides << print_side(5).zip(print_side(4), print_side(0), print_side(2))
                          .map { |row| row.join(" ") } 
    sides << print_side(3)
    sides.each { |row| puts row }
    nil
  end

  self
end

#This is a software model of a Rubik's cube, providing a dynamic data structure with which to describe the state and orientation of any cube in any legal position. 
#
#I have included a set of solver methods that work every time, although pretty inefficiently. If you come across an edge case, please let me know!
#
#It's my hope that some people will use this nomenclature to write more efficient solving algorithms than mine. My intent was to reproduce my own thought process when solving, and I am not a speedcuber, I just know one basic way to solve the cube and wanted to see if I could make my program run that same routine (more or less).  
#
#
#DATA STRUCTURE:
#
#The @cube attribute contains 6 arrays of 9 elements, each array describes one side of the cube like so:
#
#    @cube[0] - top
#    @cube[1] - left
#    @cube[2] - back
#    @cube[3] - right
#    @cube[4] - front
#    @cube[5] - bottom
#
#The first element @cube[x][0] in any array describes the center square of that face, and remains static in relation to the other sides, just as a real cube's center square would. 
#
#The remaining array elements from [1] - [8] start at "12 o'clock" and move clockwise. Thus: Even numbers are middle cubies and odd numbers are always corner cubies.
#      
#      |8|1|2|
#      |7|0|3|
#      |6|5|4|
#
#"12 o'clock" is constant amongst all sides of the cube, and refers to what "north" would be if the cube was unfolded into two dimensions like so:
#
#          1
#      5,4,0,2
#          3
#
#When cube orientation procedures are applied, the "address" of each side remains consistent with the above diagram, even as the sides themselves represent different numbers. (The sides could just as easily be assigned any symbol or string or whatnott, just as long as each side started off all the same thing, the cube would be in a legal state).
#
#For example: if you created a new cube and then applied Cube#turn, the sides would appear like so:
#
#          4
#      5,3,0,1
#          2
#
#But the address of the location of these sides would remain static. This is so that complex move combinations can be applied to a cube regardless of its orientation to the "viewer."
