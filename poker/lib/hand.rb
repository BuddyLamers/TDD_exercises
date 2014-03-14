require_relative 'deck'

class Hand

  def self.deal_from(deck)
    Hand.new(deck.take(5))
  end


  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end


end