
class Character

      @speed=0
      @strength=0
      @intelligence=0
      @health=0
   	def initialize()
      	raise nomethodexception
   	end

    def display_attributes()
      puts
      puts "Speed: #@speed"
      puts "Strength #@strength"
      puts "Intelligence #@intelligence"
      puts "health #@health"
    end
    #adds weapon's attributes to character's attributs making the character stronger.
   	def add_weapon(weapon)
      add_speed, add_strength, add_intelligence, add_health = weapon.get_attributes()
      @speed += add_speed
      @strength += add_strength
      @intelligence += add_intelligence
      @health += add_health
    end

    #displays both character's and additional weapon's attributes.
    def display_last_attr(weapon)
      add_speed, add_strength, add_intelligence, add_health = weapon.get_attributes()
      puts
      puts "Speed: #@speed+#{add_speed}" 
      puts "Strength #@strength+#{add_strength}"
      puts "Intelligence #@intelligence+#{add_intelligence}"
      puts "health #@health+#{add_health}"
    end

    def getStrength()
      return @strength
    end

    def getHealth()
      return @health
    end

    def getSpeed()
      return @speed
    end

    def getIntelligence()
      return @intelligence
    end
end




=begin
if true
	person = People.new
end

person.increase_attack()
person.display_attributes()
=end
