require './Deck.rb'
require './Player.rb'
require './PokerOddsProxy.rb'
require './Database.rb'

class Table

	include Enumerable

	def initialize(number, money)


		@deck = Deck.new
		@names = %w(User Eren Mikasa Jen Cara Armin Michael Tom)
		@players = []
		@board = []
		@playernumber = number
		

		@pokeroddsproxy = PokerOddsProxy.new

		@pot = 0
		@bet = 50
		@dealer = 0

		#add players to table
		addplayer(number,money)
		

	end

	#gets cards on the board and returns it in a string
	def get_cards()
		result = ''
	    @board.each do |card|
	      result = result + card.to_s
	    end
	    return result
	end

	#the game continues here until user decides to finish
	def continue_game

		start_game
		play_game

		puts "Press 1 to continue the game."
		puts "If you don't want to continue, press anything else."
		input  = gets().chomp().to_i

		while input == 1
			
			
			start_game
			play_game

			puts "Press 1 to continue the game."
			puts "If you don't want to continue, press anything else."
			input  = gets().chomp().to_i

		end

		endgame

	end

	#when the game ends saves data to database and loads from it.
	def endgame()
		@database = Database.new
		@database.save_files(@players)
		@database.load_files
	end

	#add players to table.
	def addplayer(number, money)

		
		number.times do |i|


			#puts i
			@players << Player.new(@names[i],money)
			if i == 0
				#puts "enters if"
				@players.at(i).makeuser
			end
			#puts @names[i]
		end

	end

	#player folds.
	def player_fold(i)
		puts @players.at(i).get_name + "has folded"
		@player.at(i).fold

	end

	#starts the game by dealing cards to the players and board, resets the table and deck.
	def start_game
		@pot = 0
		@bet = 50
		@deck = Deck.new
		@board = []
		@players.each do |player|
			#puts number
			player.begin_game()#all have to enter
			player.add_cards(@deck.deal)
			player.add_cards(@deck.deal)

		end

		@board << @deck.deal
		@board << @deck.deal
		@board << @deck.deal

		if @dealer == (@playernumber-1) #change the dealer
			@dealer = 0
		else
			@dealer = @dealer + 1
		end
		puts "Dealer is #{@players.at(@dealer).get_name}" 

	end
	#get input from user about his decision.
	def get_input
		puts "Press 1 to raise by 100"
		puts "Press 2 to call"
		puts "Press 3 to fold"
		input = gets().chomp().to_i
		return input

	end

	#the game is played here. Players call, raise, and fold here.
	def play_game
		
		2.times do 
			
			puts to_s
			@players.each do |player|

				if player.is_fold

					next
				end
				puts player.to_s
				odds = @pokeroddsproxy.get_odds(player.get_cards, get_cards, @playernumber)
				#puts player.get_cards
				if player.get_user
					input = get_input
					amount = 0
					if input == 1
						amount = 100 + @bet
					elsif input == 2
						amount = @bet
					else
						amount = 0
						player.fold
					end
					player.removemoney(amount)
					@pot = @pot + amount 
				else
					amount = player.set_move(odds, 200, 200)
					player.removemoney(amount)
					@pot = @pot + amount 
				end
				#puts get_cards
				puts odds
				puts
			end
			
			puts "pot: #{@pot}"

			@board << @deck.deal
		end

		find_winner
	end

	#In the end of the game, winner is decided.
	def find_winner()
		ingame_players = 0
		last_cards = []

		#puts "In find winner method"
		puts to_s

		@players.each do |player|
		

			if !player.is_fold
				last_cards << player.get_cards
				
			end

		end
		@players.each do |player|
			

			if !player.is_fold
				
				puts
				player.increase_game
				#i = last_cards.index(player.get_cards)
				#last_cards.insert(0, last_cards.delete_at(i)) 
				cards_of_players = "#{last_cards.join("")}"
				#puts "Order of cards: " + cards_in_order
				#puts "get cards: " + get_cards
				winner = @pokeroddsproxy.get_winnercards(cards_of_players, get_cards)
				#odds = @pokeroddsproxy.get_odds(cards_in_order, get_cards, ingame_players)
				#puts odds

				if winner == player.get_cards #If winner's cards are same with the player
					puts "#{player.get_name} is the winner"
					player.addmoney(@pot)
					player.increase_win
				else
					puts "#{player.get_name} is the loser"
					player.increase_lose
				end

			end

		end

	end



	def increasebet(amount)

		@bet = @bet + amount
	end

	#player calls the game.
	def player_call(i)
		@players.at(i).removemoney(@bet)
		@pot = @pot + @bet
	end

	def player_winner(i)
		@players.at(i).addmoney(@pot)
	end

	def to_s

		result = "Board is "
    	@board.each do |card|
      		result = result + card.to_s 
      	end
    	return result
	end 

	
end



#puts table.to_s