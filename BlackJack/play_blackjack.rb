require './blackjack'
require 'pry'
$hit = :y
#Deal to player and dealer
deck = Deck.new
player_hand = Hand.new
dealer_hand = Hand.new
#Deal initial hands
  player_hand.add(deck.draw, deck.draw)
  dealer_hand.add(deck.draw, deck.draw)
def show_table_without_dealer_value player_hand, dealer_hand
  system "clear"
  puts "Player Hand: #{player_hand.to_s}  Hand Value: #{player_hand.value} "
  puts "Dealer Hand: #{dealer_hand.to_s.slice(0..1)}  Hand Value: ? "
end

def show_table_with_dealer_value player_hand, dealer_hand
  system "clear"
  puts "Player Hand: #{player_hand.to_s}  Hand Value: #{player_hand.value} "
  puts "Dealer Hand: #{dealer_hand.to_s}  Hand Value: #{dealer_hand.value}"
end

def ask_for_a_hit player_hand, dealer_hand, deck
  until $hit == :n || player_hand.busted? do 
    show_table_without_dealer_value player_hand, dealer_hand
    print "Would you like to hit? Type y or n > "
    $hit = gets.chomp.to_sym
    if $hit == :y
      player_hand.add(deck.draw)
    end
  end
end


#Autodeal to the dealer's hand

player_wins = false
dealer_wins = false

if !dealer_hand.blackjack? && !player_hand.blackjack?
  until player_wins || player_hand.busted? || $hit == :n do
    ask_for_a_hit player_hand, dealer_hand, deck
  end
  until dealer_hand.value >= 17 || dealer_hand.busted? || player_hand.busted? do
    dealer_hand.add(deck.draw)
  end
else
  if dealer_hand.blackjack?
    dealer_wins = true
  else
    player_wins = true    
  end
end

if player_hand.busted?
  show_table_without_dealer_value player_hand, dealer_hand
  puts "Player Busted!"
  dealer_wins = true
elsif dealer_hand.busted?
  show_table_with_dealer_value player_hand, dealer_hand
  puts "Dealer Busted!"
  player_wins = true
elsif dealer_hand.value == player_hand.value
  show_table_with_dealer_value player_hand, dealer_hand
  puts "Push!"
elsif dealer_hand.value > player_hand.value
  dealer_wins = true
elsif dealer_hand.value < player_hand.value
  player_wins = true
end


if dealer_wins
  show_table_with_dealer_value player_hand, dealer_hand
  puts "Dealer wins!"
elsif player_wins
  show_table_with_dealer_value player_hand, dealer_hand
  puts "Player wins!"
elsif dealer_wins && player_wins
  show_table_with_dealer_value player_hand, dealer_hand
  puts "Dealer "
end
