require './tictacgame'
#Start the game
game = TicTacToeGame.new

#Show the board
game.showboard
class Player1
  def get_entry
    print "Player 1, Enter the number space to claim >"
    entry1 = gets.chomp
    return entry1.to_i
  end
end

class Player2
  def get_entry
    print "Player 2, Enter the number space to claim > "
    entry2 = gets.chomp
    return entry2.to_i
  end
end

player1 = Player1.new
player2 = Player2.new

until game.over?
    system "clear"
    game.showboard
    entry1 = player1.get_entry
    game.update_board(entry1, 1)
    game.check_board "X"
    if game.player1_won? || game.game_is_tie?
      break
    end

    system "clear"
    game.showboard
    entry2 = player2.get_entry
    game.update_board(entry2, 2)
    game.check_board "O"
    if game.player2_won? || game.game_is_tie?
      break
    end
end

if game.player1_won?
  system "clear"
  game.showboard
  puts "Player 1 Wins!"
elsif game.player2_won?
  system "clear"
  game.showboard
  puts "Player 2 Wins!"
else
  system "clear"
  game.showboard
  puts "Game is a draw!"
end

