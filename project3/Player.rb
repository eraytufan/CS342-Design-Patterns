require './Card.rb'

class Player

	def initialize(name, money)
		@name = name
		@cards = []
		@money = money
		@fold = false
		@playstyle = rand(1..4)
		#puts @playstyle
		@isuser = false

		@fold_number = 0
		@win_number = 0
		@lose_number = 0
		@games_number = 0


	end

	

	def is_fold()
		return @fold
	end

	def makeuser()
		@isuser = true
	end

	def get_user()

		return @isuser
	end

	def addmoney(amount)

		@money = @money + amount
	end

	def removemoney(amount)
		if @money > amount
			@money = @money - amount
		else
			@money = 0
		end
	end

	#Checks if user is ready to call or raise.
	#If gamer wants to fold it returns false.
	#If gamer wants to raise or call returns true.
	def check_move(odds, bet)
		if @money < bet
			return false #user does not have any money

		#depending on the playstyle decides the game.
		elsif @playstyle == 1 or @playstyle == 3 
			
			if odds > 0.10
				return true
			else
				
				return false
			end



		elsif @playstyle == 2 or @playstyle == 4
			if odds > 0.15
				return true
			else
				
				return false
			end

		
		end
	end
	#Decides if he wants to only call or raise the bet.
	#Depending on the playstyle the amount he raises changes.
	#returns the amount gamer wants to raise.
	def raise_pot(odds, potsize)
		if odds <0.21
			return 0

		elsif @playstyle == 1 or @playstyle == 2
			if @money > 50 and potsize <400 
				return 50
			else
				return 0
			end

		else
			if @money > 100 #raise high
				return 100
			else
				return 0
			end

		end

	end

	#sets what the gamer wants to do based on parameters
	def set_move(odds, potsize, bet)
		if check_move(odds, bet)
			raise_amount = raise_pot(odds, potsize)
			if raise_amount > 0
				puts "#{@name} raises by #{raise_amount}"
				return raise_amount + bet
			else
				puts "#{@name} checks"
				return bet
			end
		else
			fold()
			puts "#{@name} folds"
			return 0
		end
	end

	def add_cards(card)

		@cards << card
	end

	#returns player's cards
	def get_cards()
		result = ''
	    @cards.each do |card|
	      result = result + card.to_s
	    end
	    return result
	end


	def remove_cards()

		@cards = []
	end

	def fold()
		@fold_number = @fold_number + 1
		@fold = true
	end

	#returns to the beginning of game and removes cards.
	def begin_game()
		@fold = false
		remove_cards
	end

	def get_name()
		return @name
	end

	

	def to_s

		
		result = "#{@name}\n"
    	@cards.each do |card|
      		result = result + card.to_s 
      	end
    	return result
	end

	def increase_game
		@games_number = @games_number + 1
	end

	def increase_win
		@win_number = @win_number + 1
	end

	def increase_lose
		@lose_number = @lose_number + 1
	end

	def get_game
		@games_number
	end

	def get_win
		@win_number
	end

	def get_lose
		@lose_number
	end

	def get_fold
		@fold_number
	end

end

#player = Player.new('Eray')
#player.makeuser
#player.add_cards(Card.new('5','d'))
#player.add_cards(Card.new('7','h'))
#puts player.to_s
#player.get_cards
#player.remove_cards()
#player.get_cards
#puts player.check_move(0.4)
