require_relative 'Cell'
require_relative 'Ant'
require_relative 'Queen'
require 'singleton'



class Meadow

  include Singleton

  
  attr_accessor :totalHills, :meadow, :turn

  def initialize
    @turn = 0
    @size = 25
    queenNo = 10
    @meadow = Array.new(@size){Array.new(@size){Cell.new}}
    @myqueen = Queen.new
    anthill_names = ["Spider-man", "Batman", "IronMan", "Thor","SuperMan","Daredevil","IronFist","Aquaman", "CaptainAmerica", "Deadshot","Joker","Scarecrow"]
    @myqueen.create_Hill(@meadow).setNames(anthill_names)
    @queens = Array.new(queenNo){@myqueen}
    @totalHills = 0
    send_Queens
    place_Foods
  end

  #print round for each five rounds
  def print_fiverounds
    if (@turn % 5) == 0
      puts "============Turn is #{@turn}==========="
    end

  end

  #add ant to a given cell
  def add_AntToCell(ant,x,y)
    @meadow[x][y].add_Ant(ant)
  end

  #remove ant from given cell
  def remove_AntFromCell(ant,x,y)
    @meadow[x][y].remove_Ant(ant)
  end

  
  #place foods to the cells randomly.
  def place_Foods
    foodNumber = rand(10)+10
    foodNumber.times do
      @meadow[rand(@size)][rand(@size)].increaseFoodBy(1)
    end
  end

  #send queens to the meadow to find their anthills.
  def send_Queens
    @queens.each do |queen|
      queen.create_Hill(@meadow)
      @totalHills += 1
    end
  end

  #for each turn of the game, this method is called.
  #It passes through all cells, and ants in each cell does their mission.
  #At the end of the round, adds foods to the cells.
  def turn
    print_fiverounds
    
    @meadow.each_with_index do |sub, x|
      sub.each_with_index do |cell, y|
        cell.turn(x, y, @turn) #for each cell in the cell, ants play their mission.
      end
    end
    if @totalHills <= 1 #If there is less than 2 hills remained the game will end.
      get_Winner 
    end
    place_Foods
    @turn += 1
  end

  #At the end of the game, prints the winner of the game.
  def get_Winner
    puts "Winner of the game after #{@turn} turns"
    puts
    @meadow.each_with_index do |sub, x|
      sub.each_with_index do |cell, y|
        if cell.is_hill #the last remaining hill.
          cell.get_Winner

          puts "The game is Over."
          exit
        end                
      end
    end

  end


end


