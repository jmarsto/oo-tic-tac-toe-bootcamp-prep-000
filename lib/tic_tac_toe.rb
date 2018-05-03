class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == NIL
      return FALSE
    else
      return TRUE
    end
  end
  
  def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) == FALSE
      return TRUE
    else
      return FALSE
    end
  end
  
  def turn_count
    @board.count("X") + @board.count("O")
  end
  
  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if !valid_move?(index)
      turn
    else
      move(index, current_player)
      display_board
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        FALSE
      end
    end
  end
  
  def full?
    @board.all? {
      |i| i === "X" || i === "O"
    }
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      winnerat = won?
      winneratexplicit = winnerat[0]
      winnertoken = @board[winneratexplicit]
      return winnertoken
    end
  end
  
  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end