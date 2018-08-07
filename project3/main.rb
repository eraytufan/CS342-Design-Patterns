require './Table.rb'



def main()

	

	puts "Enter how many players"
	players = gets().chomp().to_i

	puts "what's the starting chip amount"
	chip = gets().chomp().to_i

	table = Table.new(players, chip)
	
	table.continue_game

	
end

main()



