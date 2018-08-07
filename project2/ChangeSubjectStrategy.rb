require './Response.rb'


class ChangeSubjectStrategy < Response

  
  
	#Prints the change subject choice from the text file.
	#With using counter, when user asks the same question
	#if there is a different choices it will a different answer.
  def printScreen(sentence)
    if(@hash[sentence].length > @counter)
    	puts @hash[sentence][@counter]
    	@counter += 1
	else
		puts @hash[sentence][0]
		@counter = 1
	end

  end

  
  
end