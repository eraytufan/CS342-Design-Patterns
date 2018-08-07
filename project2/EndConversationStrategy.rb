require './Response.rb'


class EndConversationStrategy < Response

  
  
	#Print end conversation message to screen.
  def printScreen(sentence)
    puts @hash[sentence]
  end

  
  
end