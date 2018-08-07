For my template class chatbot, I created constructer and used the methods which was
going to be used by inheriting classes. I created hash variable to store the data. I used 
set_filename and get_input methods which was necessary to get data from the text files. 

I wrote get_input method to chatbot class because it was the same method for happy, angry and sad bots.
Only filename was different so set_filename is an abstract method and had to be implemented. So writing 
get_input method on chatbot class, I only wrote it once instead of 3 times. 

I also wrote the update method in  chatbot class because of the same reason. 
Update methods were exactly the same for 3 bots. If I wanted I could override the update method but
was not necessary.

I did not change the main method because the professor didn't want it. 

User class is my subject class for the observer pattern. It implements observable and when user enters input,
it notifies the observers.

I wrote enterchat method to add observers to the subject in chatbot class.

I wrote response class as a strategy pattern, so inheriting objects had to write print to screen method to
write the necessary answers to the screen such as matchstrategy class and questionstrategy class.

Overall I used 3 patterns, template, observer and strategy patterns. I used observer module to create subject,
and notify the observers. Each chatbot has it's own answers and they are all printed to the screen when
user enters input. I wrote additional comments to the code also to make it easier for the reader.