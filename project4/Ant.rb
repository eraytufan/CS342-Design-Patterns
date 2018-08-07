require_relative 'Anthill'


class Ant

  attr_accessor :type, :location, :experience, :anthill, :x, :y

  def initialize
    @boundry = 23
    @type = ""
    @anthill = nil
    @experience = false
    @x = nil
    @y = nil
  end

  def move
    move_number = rand(4)

    check = check_move(move_number)
    #loop until ant can find a new direction which it can go
    while check == false
      move_number = rand(4)
      check = check_move(move_number)

    end
    moveto_newcell(move_number)
  end

  #move ant to a new cell.
  def moveto_newcell(direction)
    meadow = Meadow.instance
    meadow.remove_AntFromCell(self,@x,@y)

    if direction == 0 #up
      @y -= 1
    elsif direction == 1 #down
      @y += 1
    elsif direction == 2 #left
      @x -= 1
    else #right
      @x += 1
    end
    meadow.add_AntToCell(self,@x,@y)
  end

  #returns true if the move is legit.
  def check_move(direction)

    if direction == 0 #up
      if @y < 1
        
        return false
      end
    elsif direction == 1 #down
      if @y > @boundry
        
        return false
      end
    elsif direction == 2 #left
      if @x < 1
        
        return false
      end
    else #right

      if @x > @boundry
        
        return false
      end

    end

    return true
  end

end
