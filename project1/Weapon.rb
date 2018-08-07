


class Weapon

    #These attributes increases character's attributes.
   	@incr_speed=0
    @incr_strength=0
    @incr_intelligence=0
    @incr_health=0

    def get_attributes()

    	return @incr_speed, @incr_strength, @incr_intelligence, @incr_health
    end


   	def initialize()
      	raise nomethodexception
   	end

   	def display_attributes()
      puts
      puts "Speed: +#@incr_speed"
      puts "Strenth +#@incr_strength"
      puts "Intelligence +#@incr_intelligence"
      puts "health +#@incr_health"
    end

end

