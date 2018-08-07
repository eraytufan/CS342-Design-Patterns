require './Card.rb'
require "enumerator"


class Deck

	include Enumerable

  def initialize
    @ranks = %w(2 3 4 5 6 7 8 9 T J Q K A)
    @suits = %w(c d h s)
    @cards = []

    @ranks.each do |rank|
      @suits.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end

    shuffle()
  end

  #deals cards
  def deal
    @cards.shift
  end


  def shuffle
    @cards.shuffle!
  end

  #returns the cards as string
  def to_s
    result = ''
    @cards.each do |card|
      result = result + card.to_s + "\n"
    end
    return result
  end

end

#deck = Deck.new
#puts deck.to_s