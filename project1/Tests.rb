require './Character.rb'
require './Enemy.rb'

class Tests



   	def initialize(character)
      	@mycharacter = character
         @successful_mission = 0
         @failed_mission = 0
   	end

      def getMissionReport()

         return @successful_mission, @failed_mission
      end

   	def battletest(enemy)
         enemyhealth = enemy.getHealth() *10
         enemyattack = enemy.getStrength()
         enemyspeed = enemy.getSpeed()

         herohealth = @mycharacter.getHealth() *10
         heroattack = @mycharacter.getStrength()
         herospeed = @mycharacter.getSpeed()

         #Enemy's attack
         t1 = Thread.new do

            while herohealth > 0 and enemyhealth > 0
               numb1 = rand(10)#add random number to attack power.
               damage = enemyattack + numb1
               herohealth = herohealth - damage
               puts "Enemy makes #{damage} damage"
               puts "Hero health dropped to #{herohealth}"
               puts
               if herohealth <1
                  puts "Hero is dead. You have failed the battle test."
                  @failed_mission += 1
               end
               sleep(1/herospeed)#If hero is fast then thread waits less time.
            end
            
            
         end

         #Hero's attack
         t2 = Thread.new do

            while herohealth > 0 and enemyhealth > 0
               numb2 = rand(10)#add random number to attack power.
               damage2 = heroattack+numb2
               enemyhealth = enemyhealth - damage2
               puts "Hero makes #{damage2} damage2"
               puts "Enemy health dropped to #{enemyhealth}"
               puts
               if enemyhealth <1
                  puts "Enemy is dead. You have passed the battle test."
                  @successful_mission += 1
                  break
               end
               sleep(1/enemyspeed)


            end
            

            
         end

         t1.join
         t2.join
   	end

   	def intelligencetest()
         if @mycharacter.getIntelligence() > 15#if intelligence is high, then the question gets easier.
            numb1 = rand(10)
            numb2 = rand(10)
            
         elsif @mycharacter.getIntelligence() > 10
            
            numb1 = rand(100)
            numb2 = rand(100)
         else
            numb1 = rand(1000)
            numb2 = rand(1000)
         end
         puts
         puts "What is #{numb1} + #{numb2}"
         input = gets.chomp.to_i
            
            if input == (numb1 + numb2)
               puts "Correct answer. You passed intelligence test."
               @successful_mission +=1
            else
               puts "Wrong answer. You failed intelligence test"
               @failed_mission += 1
            end
   	end

   	def speedtest()
         #If character has more speed then user has more time to write the given sentence.
         puts "You have #{5+@mycharacter.getSpeed()} seconds to write the given sentence to pass speed test."
         puts
         puts "Attack on Titan is the best anime of the world."

         t1 = Time.now
         
         input = gets.chomp
         t2 = Time.now
         delta = t2-t1

         

         if input == "Attack on Titan is the best anime of the world."
            puts "You finished in #{delta} seconds"
            if delta < 5+@mycharacter.getSpeed()
               puts "You have passed speed test."
               @successful_mission +=1
            else
               puts "You have failed speed test."
               @failed_mission += 1
            end

         else
            puts "You entered string wrong. You have failed speed test."
            @failed_mission += 1
         end
   	end

   	

end