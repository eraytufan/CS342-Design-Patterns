require 'open-uri'
require './APIProxy.rb'

class PokerOddsProxy

	def initialize()
		@apiproxy = APIProxy.new
		
	end

	#checks the connection and if it does not get odds from server it returns random
	def get_odds(playercards, board, player_count)

		@odds = @apiproxy.get_odds(playercards, board, player_count)
		#puts @odds
		if @odds != 0
			return @odds
		else
			#puts "Random"
			return Random.new.rand((0.001)..(0.5))
		end
	end

	#checks the connection and if it does not get winner cards from server it returns first cards as winner
	def get_winnercards(playercards, board)

		winner_cards = @apiproxy.get_winnercards(playercards, board)

		if winner_cards != 0
			return winner_cards

		else
			return playercards[0...2]
		end
	end
end

#poker = PokerOddsProxy.new
#puts poker.get_odds("TdTc","Ts9sJs", 4)