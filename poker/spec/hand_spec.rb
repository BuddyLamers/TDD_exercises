require 'rspec'
require 'hand'

describe Hand do
  let(:cards) do
    [
      Card.new(:spades, :king),
      Card.new(:spades, :queen),
      Card.new(:spades, :jack),
      Card.new(:clubs,  :ten),
      Card.new(:hearts, :queen)

    ]
  end

  let(:deck) { double('deck') }

  let(:hand_with_cards) { Hand.new(cards) }

  describe '::deal_from' do

    it 'should create a new hand with 5 cards from a passed deck' do
      deck.should_receive(:take).with(5).and_return(cards.dup)
      expect(Hand.deal_from(deck).cards).to eq(cards)
    end
  end

  describe '#initialize' do

    it 'should initialize with cards passed in' do
      expect(Hand.new(cards).cards).to eq(cards)
    end

  end

  describe '#draw' do

    it 'should take n cards from deck' do
      hand_with_cards.cards = cards.last(2)
      deck.should_receive(:take).with(3).and_return(cards.first(3))
      hand_with_cards.draw(3, deck)
      hand_with_cards.cards.should =~ cards
    end

    it 'raise error if trying to take more than 3' do
      expect { hand_with_cards.draw(4, deck) }.to raise_error(
                                                    "can't draw more than 3")
    end

    it 'raise error if hand will have more than 5 cards' do
      expect { hand_with_cards.draw(3, deck) }.to raise_error(
                                                "can't have more than 5 cards")
    end
  end

  describe '#discard' do

    it "should remove the card from hand" do
      hand_with_cards.discard('A♠')
      expect(hand_with_cards.cards.length).to eq(2)
    end

    it "should not allow more than 3 cards to be returned" do
      expect {hand_with_cards.discard('A♠')}.to raise_error "discard max 3 cards"
    end

  end

  describe '#to_s' do

  end

  describe '#beats?' do


  end





  #sort cards by value --check for sequence
  #if all cards are the same suit

end