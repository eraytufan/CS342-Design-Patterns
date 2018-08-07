require './MatchStrategy.rb'
require './QuestionStrategy.rb'
require './ChangeSubjectStrategy.rb'
require './EndConversationStrategy.rb'



class Chatbot
  #it has to be implemented by classes that inherits chatbot. 
  def set_filename
    raise nomethoderror
  end

  def initialize()
    @hash = Hash.new{|hsh,key| hsh[key] = [] }
    @filename = ""
    set_filename() #Filename must be set by inheriting classes.
    get_input()
    @match = MatchStrategy.new(@hash)
    @question = QuestionStrategy.new(@hash)
    @change = ChangeSubjectStrategy.new(@hash)
    @endconv = EndConversationStrategy.new(@hash)

  end

  #Gets input from the file. Hash and key-value pairs are used to store the data.
  def get_input()
    

    sentence = []
    File.open(@filename, "r").each do |test|
      sentence = test.chomp.split(":")
      question = sentence[0].to_s #question in the file
      string = sentence[1].to_s
      answer = string.split(";") #answers of the data
      

      answer.each do |ans|
        @hash[question] << ans #add question and answers as key-value pairs
      end 

    
    end

  end
#Used it if I was able to store data to hash correctly.
  def print_lines()

    array = @hash.keys 
    puts array
  end
#add observers. It is called from main function.
  def enterChat(user)
    @subject = user
    @subject.add_observer(self)

  end

#When subjects notifies the observers.
  def update(sentence)       # callback for observer

    array = @hash.keys 

    
    #If user enters only 1 word, all observers will be deleted which will result ending the program.
    if(!sentence.strip.include? " ")
      @endconv.printScreen("goodbye")
      @subject.delete_observers()
      #puts "string is 1 word"
      return
      
    end
    #Search if user inputted sentence has a matching question in the text file.
    array.each do |question|  
      #puts question
      if(sentence.include? question)#If any question matches user input
        #puts "String includes #{question}"
        @match.printScreen(question)
        return
      end
      
    end
    #If there is a question mark in the input
    if (sentence.strip.include? "?")
      #puts "question mark"
      @question.printScreen(sentence)

      #The input does not fit any category.
    else
      #puts "change subject"
      @change.printScreen("change subject")
      
    end
    
    
  end


  
end