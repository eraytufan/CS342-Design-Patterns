require_relative 'Ant'


#Queen class to send queen ants to meadow and let them create their own anthills. It uses a build pattern.
class Queen

	def initialize()
		@queen = Ant.new
		@names = []
		@counter = 0
	end

	def setNames(anthill_names)
		@names = anthill_names
		self
	end

	#create hill.
	def create_Hill(meadow)
      numb1 = rand(25)
      numb2 = rand(25)
      #If there is another hill in that cell, find new cell coordinates.
      while meadow[numb1][numb2].hill != nil
        numb1 = rand(25)
      	numb2 = rand(25)
      end
      
      @counter += 1
      meadow[numb1][numb2].hill = Anthill.new(numb1, numb2, @names[@counter])
      self
    end


end

#queen = Queen.new
#queen.createHill()