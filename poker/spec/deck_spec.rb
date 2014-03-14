require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  let(:cards) do
    [
      Card.new(:spades, :king),
      Card.new(:spades, :queen),
      Card.new(:spades, :jack)
    ]
  end

  describe '::all_cards' do
    it 'should return 52 cards' do
      expect(Deck.all_cards.count).to eq(52)
    end

    it 'each card should be unique' do
      expect(Deck.all_cards.uniq.count).to eq(52)
    end

  end

  describe '#initialize' do

    it 'will set ivar cards to all cards by default' do
      expect(deck.cards).to eq(Deck.all_cards)
    end

    it 'will set ivar cards to provided cards if passed in' do
      expect(Deck.new(cards).cards).to eq(cards)
    end

  end

  describe '#count' do

    it 'should return the correct count of cards remaining' do
      expect(deck.count).to eq(52)
    end


  end

  describe "#take" do

    let(:test_deck) { Deck.new(cards.dup) }

    it "should take n cards from the top of the deck" do
      expect(test_deck.take(2)).to eq([ cards[0], cards[1] ])
    end

    it "removes cards from the deck" do
      test_deck.take(2)
      expect(test_deck.count).to eq(1)
    end

    it "should not allow you to take more cards than are in the deck" do
      expect {test_deck.take(4)}.to raise_error("not enough cards")
    end

  end

  describe "#return" do

    let(:test_deck) { Deck.new(cards.dup) }

    it "should add n cards back to the deck" do
      expect(test_deck.return(cards.dup).count).to eq(6)
    end

    it "adds cards to the bottom of the deck" do
      expect(test_deck.return([cards[0].dup]).last).to eq(cards[0])
    end

    it "does not destroy the passed array" do
      cards_dup = cards.dup
      test_deck.return(cards_dup)
      expect(cards_dup.length).to eq(3)
    end

  end
end