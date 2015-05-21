require 'pry'

class HangmanGame

  def initialize
    @word = File.read("wordlist.txt").split(" ").sample
    @answer = @word
    @tries = 10
    @answer_array = @answer.chars
    @length = @answer_array.length
     @guess_array= Array.new(@length).map {|x| x="_"}
    @user_has_won = false
    @guessed = []
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
      @guessed.push guess
    end
    if @guess_array.include?("_") == false
      @user_has_won = true
    end
    # binding.pry
  end

  def printout
    puts @guess_array.join(" ")
    puts "You have #{@tries} guesses remaining"
    @guessed_string = @guessed.join(" ")
    puts "You have guessed: #{@guessed_string}"
  end

end
