require_relative 'Ant'
require_relative 'Anthill'

class Cell

  attr_accessor :hill, :food, :ants

  def initialize
    @ants = []
    @hill = nil
    @food = 0
    
  end

  #can the number divided by 5
  def divide_by5(number)
    if (number % 5) == 0
      return true
    else
      return false
    end

  end
  


  #Warrior ant's method. Warrior ant kills other ants and there is a slight chance of
  #defeating enemy's hill.
  def ant_Warrior(ant)
    @ants.each do |opponent|
      ant.kill(opponent)
    end
    if not @hill.nil?
      #Extra point. If ant has experience, it has more possibility of destoying another anthill.
      if ant.experience
        random_number = rand(4)
      else
        random_number = rand(5)
      end
      if random_number == 0
        @hill = nil
        ant.experience = true #If warrior ant succeeds, it gains experience against hills(bonus point).
        ant.delete_Hill(@hill)#Destroy enemy's hill.
      else
        @ants.delete(ant)
      end
    end
  end

  #Foreger ant's method. Picks the food if there is food in the cell.
  def ant_Forager(ant)
    #if there is food in the cell, foreger ant obtains it.
    if @food > 0
      ant.getFood
    end
  end

  #Builder ant's method. Creates a new room, if it can build it dies.
  def ant_Builder(ant, x , y)
    isbuilt = ant.addroom(x, y) #creates a room
    if isbuilt
      ant.killitself(ant)
    end
    #ant.kill(ant) #builder ant dies

  end

  #increase food in cell
  def increaseFoodBy(value)
    @food += value
  end

  #add ant to the cell
  def add_Ant(ant)
    @ants << ant
  end

  #remove ant from cell
  def remove_Ant(ant)
    if @ants.include? ant
      @ants.delete(ant)
    end
  end

  #Depending on their type, each ant does it's mission.
  def ants_turn(x, y)
    #Shuffle the ants so that if there are 2 warriors, the first warrior move will be randomly chosen.
    #After shuffle, if there are more than 1 warrior ants, one warrior ant will come prior to other warrior ants in the loop.
    #So the randomly chosen ant will kill other anthill's warrior ants and other type ants.

    @ants.shuffle 
    @ants.each do |ant|
      #delete ant if an't hill is destroyed.
      if ant.anthill.nil?
        @ants.delete(ant) 
        next
      end
    
      #depending on the type of the ant, ants do their missions.
      if ant.type == "warrior"  #Type is Warrior
        ant_Warrior(ant)
      elsif ant.type == "builder"  #Type is builder
        ant_Builder(ant, x, y)
      else  #Type is foreger.
        ant_Forager(ant)
      end
      #move ant to a new location.
      ant.move
    end

    #moveAnts
  end

  def turn(x, y, turnnumber)
    #When it is a hill, it starts to create new ants. 
    #Each anthill has 1 time to create ants for each turn.
    if not @hill.nil?
      @hill.create_Ants 
      #Print the status of anthill for each 5 turns.
      if divide_by5(turnnumber)
        puts to_s
      end
    end
    #If there are ants in the cell, ants do their mission.
    if not @ants.empty?
      ants_turn(x, y) 
    end
  end

  #checks if it is a hill.
  def is_hill
    return @hill
  end

  #prints the winner to the screen.
  def get_Winner
    if not @hill.nil?
      @hill.create_Ants 
      
      puts "Winner is : "+ to_s
      
    end
  else 
    return false
  end

  def to_s
    return "Anthill Name: #{@hill.name}
          Forager Ants: #{@hill.numb_Foregers}
          Warrior Ants: #{@hill.numb_Warriors}
          Builder Ants: #{@hill.numb_Builders}
          Ant Kills:    #{@hill.numb_antKills}
          Colony kills: #{@hill.numb_colonyKills}
          "
    
  end
  


end