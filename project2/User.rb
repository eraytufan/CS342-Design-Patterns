require "observer"
require './Chatbot.rb'


class User

  
 	include Observable

  def initialize(name)
    @name = name
    puts "Hello #{name}"
    puts "Enter questions to ask AI."
  end

  def converse



    
      #get input from the user and notify observers about the sentence which was entered by the user.
      sentence = gets.chomp
      changed
      notify_observers(sentence)
      
    


  end
  
  
end
