require './human_player'
require './board'
require './pieces'

class Game
  def initialize
    @board = Board.new
    @player1 = HumanPlayer.new('Bill', :white)
    @player2 = HumanPlayer.new('Ted', :black)
  end
  
  def play
    until @board.checkmate?(:white) || @board.checkmate?(:black)
      begin
        @board.render
        puts "CHECK!" if @board.in_check?(@player1.color)
        move = @player1.get_move
        @board.move(move[0], move[1])
      rescue IllegalMoveError => e
        puts e
        retry
      end
      begin
        @board.render
        puts "CHECK!" if @board.in_check?(@player2.color)
        move = @player2.get_move
        # @board.move(move[0], move[1])
        @board.move(move[0], move[1])
      rescue IllegalMoveError => e
        puts e
        retry
      end
    end
    
    puts "CHECKMATE!"
  end

end


if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
