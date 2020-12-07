class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [6, 4, 2],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
    ]
    
   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
    
  def won?
    WIN_COMBINATIONS.detect do |key|
      @board.cells[key[0]] == @board.cells[key[1]] &&
      @board.cells[key[1]] == @board.cells[key[2]] &&
      @board.taken?(key[0] + 1)
    end
  end
    
  def draw?  
    !won? && @board.full?
  end
  
  def over?
    won? || draw? || @board.full?
  end
  
  def winner
    if combo = won?
   @winner = @board.cells[combo.first]
    end
  end
  
  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.display
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
      puts "\n\n"
    end
  end
  
  def play
    while !over?
    turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
    puts  "Cat's Game!"
    end
    
  end
  
end


# puts "Please enter a number (1-9):"
  #   info = gets.strip
  #   index = input_to_index(info)
  #   if valid_move?(index)
  #     token = current_player
  #     move(index, token)
  #   else
  #     turn
      
  #   end
  #   display_board


 # def move(index, token = "X")
  #   @board[index] = token
  # end
  
  # def position_taken?(index)
  #   @board[index] != " "
  # end
  
  # def valid_move?(index)
  #   !position_taken?(index) && index.between?(0, 8)
  # end
  
  
  
  # def current_player
  #   turn_count % 2 == 0 ? "X" : "O"
  # end
 
  # def turn_count
  #   @board.count{|token| token == "X" || token == "O"}
  # end
 
  # def display_board
  #   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  #   puts "-----------"
  #   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  #   puts "-----------"
  #   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  # end

  # def turn
  #   puts "Please enter a number (1-9):"
  #   info = gets.strip
  #   index = input_to_index(info)
  #   if valid_move?(index)
  #     token = current_player
  #     move(index, token)
  #   else
  #     turn
      
  #   end
  #   display_board
  # end

  # def won?
  #   WIN_COMBINATIONS.any? do |key|
  #   if position_taken?(key[0]) && @board[key[0]] == @board[key[1]] && @board[key[1]] == @board[key[2]]
  #     return key
    
  #     end
  #   end
  # end
  
  # def full?
  #   @board.all? {|key| key != " "} 
  # end
  
  # def draw?
  #   full? && !won?
  # end
  
  # def over?
  #   won? || draw? || full?
  # end
  
  # def winner
  #   if combo = won?  
  #     @board[combo[0]]
  #   end
  # end
  
  # def play
  #   until over?
  #   turn
  #   end
  #   if won?
  #   puts "Congratulations #{winner}!"
  #   else
  #     puts "Cat's Game!"
  #   end
  # end
  