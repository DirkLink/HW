require './hangman'


#Pick a word - print out _'s for each of the letters
game = HangmanGame.new
game.printout
class Player
  def get_guess
    print "Guess a letter >"
    guess = gets.chomp
    return guess
  end
end
#ask the player for an input
player = Player.new
until game.over?
  guess = player.get_guess
  game.check_guess guess
  game.printout
end


 if game.won?
        puts "You did it!"
        puts("            
            /(|
            (  :
           __|  |  
       (____)  `|
      (____)|   |
       (____).__|
        (___)__.|")
         else
          print" You failed"
          puts("
                  (( ____  |
                  (( _____  |
                  ((_____    |
                  ((____   ----
                      /  /
                      (_(( ")
            puts"The word was: #{game.answer}" 
        end