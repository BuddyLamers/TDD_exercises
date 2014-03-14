# coding: utf-8 dinosaur

require 'rspec'
require 'card'

describe Card do
  subject(:card) {Card.new(:spades, :ace)}
  describe '#initialize' do

    it 'creates a card with correct suit' do
      expect(card.suit).to eq(:spades)
    end

    it 'creates a card with correct value' do
      expect(card.value).to eq(:ace)
    end

    it 'does not allow invalid value' do
      expect { Card.new(:spades, :turnip) }.to raise_error(
                                  "illegal suit (spades) or value (turnip)")
    end

    it 'does not allow invalid suit' do
      expect { Card.new(:turnips, :four) }.to raise_error(
                                  "illegal suit (turnips) or value (four)")
    end
  end


  describe '#poker_value' do
    it "returns the numerical value of the card" do
      expect(card.poker_value).to eq(14)
    end
  end

  describe '#==' do

    it 'returns true if two cards are identical' do
      card2 = Card.new(:spades, :ace)
      expect(card == card2).to be_true
    end

    it 'returns false if two cards are different' do
      card2 = Card.new(:hearts, :queen)
      expect(card == card2).not_to be_true
    end

  end

  describe '#to_s' do
    it 'returns the correct string interpretation of the card' do
      expect(card.to_s).to eq('A♠')
    end
  end

end