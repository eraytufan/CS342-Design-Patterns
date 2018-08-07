require './Response.rb'


class MatchStrategy < Response

  
  
	#Prints the change subject choice from the text file.
	#With using counter, when user asks the same question
	#if there is a different choices it will a different answer.
  def printScreen(quest)
  	question = quest #key value. The question which was in txt file.
    
  	if(@hash[question].length > @counter)
    	puts @hash[question][@counter]
    	@counter += 1
	else
		puts @hash[question][0]
		@counter = 1
	end
    
  end

  
  
end