In the program's card and deck classes, I created deck and cards. The cards
are shuffled and can be dealt to the table.
 
In APIProxy class, I wrote API methods to the website. So it can get the odds of the
player, and winning cards from the server.

In PokerOddsProxy class, I used proxy pattern and used APIProxy class' methods. I also 
checked the connection and if the data cannot be obtained by server, it handles the 
situation accordingly.

Player class has the attributes and methods of the player. It contains the name of the player,
money, how many loses etc. It also decides, what it is going to do in the game.

Database class, saves the players' statistics to the database by using json. It can also load
the data from the database and print to the screen.

In table class, deck, players, pot, bet initialized and all gameplay happens here. Cards
are dealt to the user, players play the game by folding, calling or raising the bet. It gets
the user inputs of gameplay and acts depending on user's choice(call, raise bet, fold).

In main class, the game is played by calling table class. The game is played based on 
all player's decisions and it continues until user decides to quit the game. When user quits,
all statistics saved to the database, and loaded from database then printed on screen.