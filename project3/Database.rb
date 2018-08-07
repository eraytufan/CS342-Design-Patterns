require './Player.rb'
require 'json'

class Database

	def initialize()


	end

	#saves the players to database by json.
	def save_files(players)
		array = []

		players.each do |player|
			hash = {
		    	:name => player.get_name,
		    	:folds => player.get_fold,
		    	:wins => player.get_win,
		    	:loses => player.get_lose,
		    	:games_played => player.get_game
			}
			
			array << hash

		end

		File.open("database.json","w") do |f|
			f.write(array.to_json)
		end

	end

	#gets data from database and prints to screen
	def load_files()
		file = File.read('database.json')
		
		data = JSON.parse(file)
        
        data.each{ |hash|

            puts "Player name: #{hash["name"]}"
            puts "Folds: #{hash["folds"]}"
            puts "Wins: #{hash["wins"]}"
            puts "Loses: #{hash["loses"]}"
            puts "Games played: #{hash["games_played"]}"
            puts
        }


	end


end


#database.save_files(players)
#database.load_files