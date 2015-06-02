require './blackjack'
require 'pry'
#Deal to player and dealer
deck   = Deck.new
player = Player.new 
dealer = Player.new

play = true
#Deal initial hands
while play do
  until player.get_bet
    player.get_bet
  end
  player.new_hand
  dealer.new_hand
binding.pry
  if deck.cards.count < 50
    deck = Deck.new
  end

  2.times do 
    player.deal deck 
    dealer.deal deck
  end
  def show_table_without_dealer_value player, dealer
    system "clear"
    puts "Player Hand: #{player.hand.to_s}  Hand Value: #{player.hand.value} "
    puts "Dealer Hand: #{dealer.hand.to_s.slice(0..1)}  Hand Value: ? "
  end

  def show_table_with_dealer_value player, dealer
    system "clear"
    puts "Player Hand: #{player.hand.to_s}  Hand Value: #{player.hand.value} "
    puts "Dealer Hand: #{dealer.hand.to_s}  Hand Value: #{dealer.hand.value}"
  end

  def ask_for_a_hit player, dealer
      show_table_without_dealer_value player, dealer
      print "Would you like to hit? Type y or n > "
      h = gets.chomp.to_sym
      if h == :y
        return true
      elsif h == :n
        return false
      else
        return ask_for_a_hit player, dealer
      end
  end



  #Autodeal to the dealer's hand

  player_wins = false
  dealer_wins = false

  if !dealer.hand.blackjack? && !player.hand.blackjack?
    until player_wins || player.hand.busted? || !ask_for_a_hit(player, dealer)
      player.deal deck
    end
    until dealer.hand.value >= 17 || dealer.hand.busted? || player.hand.busted?
      dealer.deal deck
    end
  else
    if dealer.hand.blackjack?
      dealer_wins = true
    else
      player_wins = true    
    end
  end

  show_table_with_dealer_value player, dealer
  player.check_hands dealer.hand
  player.change_wallet
  print "Would you like to play again? y/n >"
  if gets.chomp == "n"
    play = false
  end
end