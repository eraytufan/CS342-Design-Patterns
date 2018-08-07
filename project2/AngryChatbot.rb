require './Chatbot.rb'


class AngryChatbot < Chatbot

#Only file name is enough. The remaining part is done by inherited class. 
#This way I don't have to write the same code 3 times.
  def set_filename
    @filename = "chatter_angry.txt"
  end

  
end

