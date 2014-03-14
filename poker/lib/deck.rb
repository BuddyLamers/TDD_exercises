require_relative 'card'

class Deck
  attr_reader :cards
  def self.all_cards
    cards = []

    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end

    cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def take(n)
    raise 'not enough cards' if n > count
    @cards.shift(n)
  end

  def return(cards)
    @cards = @cards + cards
  end
end