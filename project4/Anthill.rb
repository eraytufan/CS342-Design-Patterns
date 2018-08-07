require_relative 'Ant'
require_relative 'Room'

class Anthill

  attr_accessor :numb_Foregers, :numb_Warriors, :numb_Builders, :numb_antKills, :numb_colonyKills, :food,:name

  def initialize(x,y,name)
    @food = 5
    @name = name
    @x = x
    @y = y
    @numb_Warriors = 0
    @numb_Foregers = 0
    @numb_Builders = 0
    @numb_antKills = 0
    @numb_colonyKills = 0
    @rooms = []

    
  end

  def add_room(x,y)
    @rooms << Room.new(x, y)
    @food -= 1
  end

  #Creates a random ant from anthill. 
  #Anthill can create all 3 ants unlike rooms. Rooms can only create one type of ant.
  def create_random_Ant

    myAnt = Ant.new

    myAnt.x = @x
    myAnt.y = @y
    myAnt.anthill = self
    rand_number = rand(3)
    if rand_number == 0
      myAnt = create_Forager(myAnt)
    elsif rand_number == 1
      myAnt = create_Builder(myAnt)
    else
      myAnt = create_Warrior(myAnt)
      
    end

    Meadow.instance.add_AntToCell(myAnt, @x, @y)
    @food -= 1 
  end

  #creates ants from rooms if it has enough food and room.
  #It only creates ants depending on the room type.
  def create_Ant_Room
    @rooms.each do |room|
      if food > 0
        myAnt = Ant.new
        myAnt.x = room.x
        myAnt.y = room.y
        myAnt.anthill = self

        if room.type == "foreger"
          myAnt = create_Forager(myAnt)
        elsif room.type == "builder"
          myAnt = create_Builder(myAnt)
        else
          myAnt = create_Warrior(myAnt)
        end

        Meadow.instance.add_AntToCell(myAnt, @x, @y)
        @food -= 1 
      else
        break
      end

    end

  end

  #Creates ants for the anthill.
  #It creates ants from anthill because if anthill does not have any
  #builder ants and does not have warrior ant, then the anthill would not have
  #any warrior ants which would make impossible for that anthill to win the game.
  def create_Ants
    while @food > 0
      create_random_Ant
      create_Ant_Room
    end
    
  end

  #create forager ant. Forager ants can only get food.
  def create_Forager(ant)
    ant.type = "forager"
    def ant.getFood
      meadow = Meadow.instance
      @anthill.food += meadow.meadow[@x][@y].food
      
    end

    @numb_Foregers += 1
    ant
  end

  #create warrior ant. Warrior ants can kill other ants and can destroy other
  def create_Warrior(ant)
    ant.type = "warrior"

    #warrior ant kills enemy ants.
    def ant.kill(enemy)
      meadow = Meadow.instance
      cell = meadow.meadow[@x][@y]

      if enemy.anthill != @anthill && enemy != self

        if enemy.type == "warrior"
          enemy.anthill.numb_Warriors -= 1
        elsif enemy.type == "builder"
          enemy.anthill.numb_Builders -= 1
        else
          if enemy.anthill.numb_Foregers > 1
            enemy.anthill.numb_Foregers -= 1
          end
        end

        cell.ants.delete(enemy)
        @anthill.numb_antKills += 1

      end



    end

    #Warrior ant wins against enemy anthill and deletes them from the game.
    def ant.delete_Hill(enemyhill)
      if enemyhill != @anthill
        @anthill.numb_colonyKills += 1
        Meadow.instance.totalHills -= 1 
        enemyhill = nil #hill is destroyed.
        #puts "#{@anthill.name} destroys #{}"
      end
    end

    @numb_Warriors += 1
    ant
  end


  def create_Builder(ant)
    ant.type = "builder"

    def ant.addroom(x,y)
      if @anthill.food > 0 and @anthill.numb_Builders > 0
          @anthill.add_room(x,y)
          @anthill.food -= 1
          return true
          #killitself(ant)
         
          #@ant.kill #kill the builder ant.
        end
        return false
    end
    def ant.killitself(ant1)
      meadow = Meadow.instance
      cell = meadow.meadow[@x][@y]
      cell.ants.delete(ant1)

      @anthill.numb_Builders -= 1
    end

    @numb_Builders += 1
    ant    
  end


    #Warrior ant destroys enemy's hill
    
  

  
end








