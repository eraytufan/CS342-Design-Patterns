
class Card
  attr_reader :rank, :suit, :color

 
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    
    
  end

  def to_s
    "#{@rank}#{@suit}"
  end

end


#card = Card.new("S", "5")
#card = Card.new("H", "4")
#card = Card.new("D", "3")
