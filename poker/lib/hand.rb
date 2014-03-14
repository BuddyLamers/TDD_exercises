require_relative 'deck'

class Hand

  def self.deal_from(deck)
    Hand.new(deck.take(5))
  end


  attr_accessor :cards :discarded

  def initialize(cards)
    @cards = cards
  end

  def draw(n, deck)
    raise "can't draw more than 3" if n > 3
    raise "can't have more than 5 cards" if (n + @cards.length) > 5
    @cards += deck.take(n)
  end


  def discard(card)
    #discard one card
    #keep track of total discarded
  end






  def beats?

  end



  private

  def is_flush?
    #false if more than one suit is present
    suits = []
    @cards.each {|card| suits << card.suit }
    if suits.uniq.length != suits.length
      return false
    else
      return true
    end
  end

  def is_straight?
    #sort, false unless cards increase in value by 1, 5 times
  end

  def is_full_house?
    #either first 3 and last 2 or first 2 and last 3 must be pair/3of
    @cards.sort!
    return true if of_a_kind?(3, @cards.first(3)) && of_a_kind?(2, @cards.last(2))
    return true if of_a_kind?(2, @cards.first(2)) && of_a_kind?(3, @cards.last(3))
    false
  end

  def of_a_kind?(n, cards)
    @cards.sort!

    #sort, either first n or last n must have same value
  end

  def high_card_value

  end

end