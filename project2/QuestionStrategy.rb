require './Response.rb'


class QuestionStrategy < Response

  
  
	#Input does not recognized by program. So it replies the question with a question.
  def printScreen(quest)
    
    puts "Actually, why don't you tell me #{quest}"
  end

  
  
end