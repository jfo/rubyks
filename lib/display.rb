class Cube

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

  #Outputs an ascii representation of the cube arrays
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
