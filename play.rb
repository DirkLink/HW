require './hangman'


#Pick a word - print out _'s for each of the letters
game = HangmanGame.new
game.printout
class Player
  def get_guess
    puts "Guess a letter >"
    guess = gets.chomp
    return guess
  end
end
#ask the player for an input
player = Player.new
until game.over?
  guess = player.get_guess
  result = game.check_guess
end
#Compare the guess
#Fill in if that letter exists
#Print out the letters again