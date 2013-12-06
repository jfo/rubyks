
class Cube

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
end
