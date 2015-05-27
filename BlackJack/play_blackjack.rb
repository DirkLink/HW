require './blackjack'
require 'pry'
player_wins = false
dealer_wins = false


def show_table_without_dealer_value player_hand, dealer_hand
  puts "Player Hand: #{player_hand.to_s}  Hand Value: #{player_hand.value} "
  puts "Dealer Hand: #{dealer_hand.to_s.slice(0..1)}  Hand Value: ? "
end

def show_table_with_dealer_value player_hand, dealer_hand
  puts "Player Hand: #{player_hand.to_s}  Hand Value: #{player_hand.value} "
  puts "Dealer Hand: #{dealer_hand.to_s}  Hand Value: #{dealer_hand.value}"
end

#Deal to player and dealer
deck = Deck.new
player_hand = Hand.new
dealer_hand = Hand.new
#Deal initial hands
2.times do 
  player_hand.add(deck.draw)
  dealer_hand.add(deck.draw)
end

#Check for blackjack on either
if dealer_hand.blackjack?
  puts "Dealer blackjack!"
elsif player_hand.blackjack?
  puts "Player blackjack!"
end
#Ask the player if he wants to hit or stay ~loop
hit = :y
until hit == :n || player_hand.busted? do 
  show_table_without_dealer_value player_hand, dealer_hand
  print "Would you like to hit? Type y or n > "
  hit = gets.chomp.to_sym
  if hit == :y
    player_hand.add(deck.draw)
  end
end

if player_hand.busted?
  show_table_without_dealer_value player_hand, dealer_hand
  puts "Player Busted!"
end
#Autodeal to the dealer's hand
if dealer_hand.value <17
  show_table_with_dealer_value player_hand, dealer_hand
  dealer_hand.add(deck.draw)
end

if dealer_hand.busted?
  show_table_with_dealer_value player_hand, dealer_hand
  puts "Dealer Busted!"
end


binding.pry