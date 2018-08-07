require_relative 'Meadow'

class Driver
	def main()
		#game1 = Meadow.new
		game = Meadow.instance
		play_game(game)
	end
	#play the game until only 1 hill remains or turn is 1000.
	def play_game(game)

		while game.totalHills > 1 and game.turn < 1000      	
	      	game.turn      
	    end
	end
end

driver = Driver.new
driver.main