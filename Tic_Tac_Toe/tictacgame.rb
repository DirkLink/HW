require 'pry'

class TicTacToeGame
  def initialize
    @player_has_won= false
    @board = [0,1,2,3,4,5,6,7,8]
    @match = false
    @tie = false
  end
  

  def over?
    player1_won? || player2_won? || game_is_tie?
  end

  def player1_won?
    @player1_has_won
  end
  def player2_won?
    @player2_has_won
  end
  def game_is_tie?
    @tie
  end


  def update_board space, player
    if player == 1
      @board[space] = "X"
    end
    if player == 2
      @board[space] = "O"
    end
  end

  def check_board player_symbol
    x_or_o = player_symbol*3
    if @board[0..2].join == x_or_o
      @match = true
    end
    if @board[3..5].join == x_or_o
      @match = true
    end
    if @board[6..8].join == x_or_o
      @match = true
    end
    if [@board[0],@board[3],@board[6]].join == x_or_o
      @match = true
    end
    if [@board[1],@board[4],@board[7]].join == x_or_o
      @match = true
    end
    if [@board[2],@board[5],@board[8]].join == x_or_o
      @match = true
    end
    if [@board[0],@board[4],@board[8]].join == x_or_o
      @match = true
    end
    if [@board[2],@board[4],@board[6]].join == x_or_o
      @match = true
    end
    
    if @board.any? {|x| x.is_a? Integer}
      if @match == true
        if player_symbol == "X"
          @player1_has_won = true
        elsif player_symbol == "O"       
          @player2_has_won = true
        end
      end
    elsif !@board.any? {|x| x.is_a? Integer}
        @tie = true
    end
  end

  def showboard
    puts @board[0..2].join(" ")
    puts @board[3..5].join(" ")
    puts @board[6..8].join(" ")
  end
end
