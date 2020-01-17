    require "pry"
class TicTacToe 
                                                                   
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6],
    [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]
    
    
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  
  def input_to_index(input)
    input.to_i-1
  end
  
  
  def move(spot, token)
    @board[spot]=token 
  end
  
  
  def position_taken?(spot)
    if @board[spot] == "X" || @board[spot] == "O"
      return true 
    else
      false 
    end
  end
  
  
  def valid_move?(spot)
    if spot < 0 || spot > 8
      return false
    end
    if @board[spot] == "X" || @board[spot] == "O"
      return false 
    else
      true 
    end
    
  end 
  
  
  def turn_count
    @board.count {|tokens| tokens == "X" || tokens == "O"}
  end 
  
  
  def current_player
    if turn_count % 2 == 0
    "X"
    else
    "O"
    end
  end
  
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      #binding.pry
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end
  
  
  def won?
    WIN_COMBINATIONS.any? do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return win_combo
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
       return win_combo
      else false
      end
    end
  end
  
  
   def full?
    #   WIN_COMBINATIONS.any? do |win_combo|
    #   if (@board[win_combo[0]]) != "X" && (@board[win_combo[1]]) != "X" && (@board[win_combo[2]]) != "X"
    #     return false 
    #   elsif (@board[win_combo[0]]) != "O" && (@board[win_combo[1]]) != "O" && (@board[win_combo[2]]) != "O"
    #     return false
    #   else true
    #   end
    # end
    
    @board.all?{|spot| spot != " "}
   end
   
   
   def draw?
    full? && !won?
   end
   
   
   def over?
     won? || draw?
   end 
   
   
   def winner
     #WIN_COMBINATIONS.any? do |win_combo|
    #   if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
    #     return "X"
    #   elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
    #     return "O"
    #   else
    #     nil
    #   end
    # end
    if win_combo = won?
      @board[win_combo[0]]
    end
   end
   
   
   def play 
     
     turn until over?
     #binding.pry
     if winner 
      puts "Congratulations #{winner}!"
     else 
      puts "Cat's Game!"
     end
   end 

end





































































