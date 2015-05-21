require 'pry'

class HangmanGame
  def initialize
    @answer = "dirkwins"
    @tries = 10
    @answer_array = @answer.chars
    @length = @answer_array.length
    @guess_array = Array.new(@length).map {|x| x="_"}
  end
  
  def over?

  end

  def printout
    puts @guess_array.join(" ")
  end

end
