require './Character.rb'
require './Sword.rb'
require './Bow.rb'
require './Staff.rb'
require './Tests.rb'
require './Enemy.rb'
require './Human.rb'
require './Elf.rb'
require './Dwarf.rb'


def print_character()
	puts "Choose your character from the following"
	puts "1) Human"
	myCharacter = Human.new
	myCharacter.display_attributes()

	puts
	puts "2) Elf"
	myCharacter = Elf.new
	myCharacter.display_attributes()


	puts
	puts "3) Dwarf"
	myCharacter = Dwarf.new
	myCharacter.display_attributes()

end

def print_weapons()
	puts "Choose your character from the following"
	puts "1) Sword"
	myWeapon = Sword.new
	myWeapon.display_attributes()

	puts
	puts "2) Bow"
	myWeapon = Bow.new
	myWeapon.display_attributes()


	puts
	puts "3) Staff"
	myWeapon = Staff.new
	myWeapon.display_attributes()

end

def make_test(myCharacter)
	test_intelligence = false
	test_speed = false
	test_battle = false
	test = Tests.new(myCharacter)

	#Until all tests are completed by the user.
	while test_battle == false or test_speed == false or test_intelligence == false 
		puts
		puts "Choose one of the following"
		if test_battle == false
			puts "1) Battle Test"
		end
		if test_speed == false
			puts "2) Speed Test"
		end
		if test_intelligence == false
			puts "3) intelligence Test"
		end

		input = gets.chomp.to_i

		if input == 1
			test.battletest(Enemy.new)
			test_battle = true
		elsif input == 2
			test.speedtest()
			test_speed = true
		elsif input == 3
			test.intelligencetest()
			test_intelligence = true
		else
			puts "You entered wrong input."
		end

	end

	success, failed =test.getMissionReport()
	puts
	puts "You have finished the game."
	puts "#{success} successful missions."
	puts "#{failed} failed missions."

	#If user wins 3 tests. 
	if success == 3
		puts "You have won the game. Congratulations."
	else
		puts "You have failed at least 1 test. You can play again if you want."
	end
end

def main()

	print_character()

	input = gets.chomp.to_i
	puts

	if input == 1
		
		myCharacter = Human.new
	elsif input == 2
		myCharacter = Elf.new
	elsif input == 3
		myCharacter = Dwarf.new

	else
		puts "You entered wrong input."
	end

	print_weapons()

	input = gets.chomp.to_i

	if input == 1
		myWeapon = Sword.new
	elsif input == 2
		myWeapon = Bow.new
	elsif input == 3
		myWeapon = Staff.new

	else
		puts "You entered wrong input."
	end

	puts "You are " + myCharacter.class.name + " and using " + myWeapon.class.name + " as a weapon"
	myCharacter.display_last_attr(myWeapon)
	myCharacter.add_weapon(myWeapon) #add weapon skills to character


	make_test(myCharacter)
	
end

main()