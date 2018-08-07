require 'open-uri'

class APIProxy

	def initialize()

		
	end

	#gets odds from the server
	def get_odds(playercards, board, player_count)
		@url = "http://stevenamoore.me/projects/holdemapi/?cards=#{playercards}&board=#{board}&num_players=#{player_count}"
		#puts @url
		#puts "http://stevenamoore.me/projects/holdemapi/?cards=AsKs&board=Ts9sJs&num_players=4"
		result = open(@url) {|f| f.read }
		result = result.to_s
		@odds = result.partition('odds":')[2].chomp('}').to_f
		#puts @odds
		#puts result
	end
	#gets winning cards from the server
	def get_winnercards(playercards, board)
		@url = "http://stevenamoore.me/projects/holdemapi/?cards=#{playercards}&board=#{board}"
		result = open(@url) {|f| f.read }
		result = result.to_s
		result = result[10...14]
		return result #winner's cards
	end

end

#poker = APIProxy.new
#poker.get_odds("AsKs","Ts9sJs", "4")
#poker.get_winnercards("6sQd2h9cTdTh","8d6d9hAd3s")