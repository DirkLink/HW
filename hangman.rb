require 'pry'

class HangmanGame
  def initialize
    @answer = "test"
    @tries = 10
    @answer_array = @answer.chars
    @length = @answer_array.length
    @guess_array = Array.new(@length).map {|x| x="_"}
    @user_has_won = false
  end
  
  def over?
    #@user_has_won || @tries.zero?
    won? || lost?
  end

  def won?
    @user_has_won
  end

  def lost?
    @tries.zero?
  end

  def check_guess guess 
    for i in 0..@length-1
      if guess == @answer_array[i]
        # binding.pry
        @guess_array[i]= guess
      end
    end
    if @answer_array.include?(guess) == false
      @tries -= 1
    end
    if @guess_array.include?("_") == false
      @user_has_won = true
    end
    # binding.pry
  end

  def printout
    puts @guess_array.join(" ")
  end

end
