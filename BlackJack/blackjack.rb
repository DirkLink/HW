require 'pry'

class Player
  attr_reader :name, :hand, :wallet
  
  def initialize name= nil
    @name = name
    @player_won = false
    @wallet = 500
    @push = false
  end

  def new_hand
    @hand = Hand.new
  end

  def check_hands dealer_hand
    if hand.busted?
      # show_table_without_dealer_value player, dealer
      puts "Player Busted!"
      @player_won = false
    elsif dealer_hand.busted?
      # show_table_with_dealer_value player, dealer
      puts "Dealer Busted!"
      @player_won = true
    elsif dealer_hand.value == hand.value
      # show_table_with_dealer_value player, dealer
      @push = true
      puts "Push!"
    elsif dealer_hand.value > hand.value
      @player_won= false
      puts "Dealer wins!"
    elsif dealer_hand.value < hand.value
      @player_won = true
      puts "Player wins!"
    end
  end

  def get_bet
    puts "Available cash: #{@wallet}"
    print "Place your bet >"
    @bet = gets.chomp.to_i
    if @bet > 0 && @bet <= @wallet
      return true
    else
      puts "Invalid bet"
      return false
    end
  end

  def change_wallet
    if @player_won == true
      @wallet += @bet
    elsif @player_won == false && @push == false
      @wallet -= @bet
    end  
  end

  def deal deck
    @hand.add(deck.draw)
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
    @cards = @cards*6
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