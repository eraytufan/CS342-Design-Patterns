

class Room

	attr_accessor :x, :y, :type
	def initialize(x, y)
		@@counter = 0
		@x = x
		@y = y
		rand(2) == 1
		@type = ""
		create_type

	end
	#create a different type of room in order.
	#so it is not random. 
	def create_type
		#randomly room's type decided.
		number = @@counter %3
		if number == 0
			@type = "forager"
		elsif number == 1
			@type = "builder"
		else
			@type = "warrior"
		end
			
		@@counter += 1
	end

	def to_s
		return "type is #{@type}"
	end

end

#room = Room.new(5,3)
#puts room.to_s

