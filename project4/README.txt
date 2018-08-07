Project 4:Ant Game


In the anthill game, there are 10 different anthills, and these have 3 different ants. 
Warrior ants fights against other ants which is not it's clan.
Forager ants collects foods from cells in the meadow.
Builder ants builts rooms which creates ants consuming food.

For the project I created 7 classes. 

In the ant class, ants' movement is declared. Ants' movements checked so that they wouldn't go out of grid.

In anthill class, different types of ants are created. Rooms which are created by builder ants
are only able to create a certain kind of ants. The ants only can be created depending on the food.
When builder ant creates a room it dies. Anthill class, has all the different methods for different 
types of ants. For example, getFood for forager ant and killenemyant method for warrior ant is written here.
Object modification is used to add forager, builder and warrior funcionality to the ants. 

In room class, I created an algorithm that determines which room type should be built next. In algorithm,
a static variable is given and room types are created depending on this static variable.

I created an extra queen class to make easier to send queen ants to the meadow. 

In meadow class, cells are created. It adds foods, ants to the cells. Using queen class and builder pattern,
queens are sent to the meadow and anthills are created. In game turns, every cell is looped through and 
ant's missions are done in each cell. Also singleton pattern is used in this class.

In cell class, ants do their missions. Ants in the cell are looped through, and each ant depending
on it's type does it's job. Also in the cell class, game turns are printed accordingly.

driver class is the class that contains the main method.

I added an experience to the ants for extra credit. If ant defaets an anthill, ant becomes experienced.
Experienced ant has better odds in the upcoming battles.

