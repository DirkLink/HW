require 'pry'

class Player
  attr_reader :name
  
  def initialize name
    @name = name
    @player_won = false
  end

end

class Card
  attr_reader :face_value, :suit
  def initialize value, suit
   @value = value
   @suit = suit
   @face_value = value
  end
  def value
    if @value == :K || @value == :Q || @value == :J
      return 10
    elsif @value == :A
      return 1
    else
      @value
    end
  end

  def to_s
    return "#{@face_value}#{@suit}"
  end
end

class Deck
attr_reader :cards, :drawn
  def initialize
    @drawn = []
    @suits = [:S,:C,:D,:H]
    @cards = []
    @card_values = [:A,2,3,4,5,6,7,8,9,10,:J,:Q,:K]
    @suits.each do |suit|
      @card_values.each do |value|
        card = Card.new value, suit
        @cards.push(card)
      end
    end
    @cards.shuffle!
  end
 

  def draw
    c = @cards.pop
    @drawn.push(c)
    return c
  end
end

class Hand
  def initialize
    @cards_in_hand = []
  end

  def add *cards
    cards.each do |card|
      @cards_in_hand.push(card)
    end
  end

  def value
    @hand_value = 0
    @cards_in_hand.each do |card|
      @hand_value += card.value
    end
    if @hand_value < 12 && has_ace? 
      @hand_value += 10
    else
      @hand_value
    end
  end

  def has_ace?
    @cards_in_hand.any? do |card|
      card.face_value == :A
     end
  end

  def busted?
    value > 21
  end

  def blackjack?
    @card_values = []
    @cards_in_hand.each do |card|
      @card_values.push(card.value)
    end
    if @card_values.include?(1) && @card_values.include?(10)
      return true
    else
      false
    end
  end

  def to_s
    @cards = @cards_in_hand
    @cards.map { |card| card.to_s }.join(", ")
  end

end