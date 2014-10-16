require './human_player'
require './board'
require './pieces'
require 'colorize'
require 'io/console'

class Game
  def initialize
    @board = Board.new
    @player1 = HumanPlayer.new('Bill', :white, @board)
    @player2 = HumanPlayer.new('Ted', :black, @board)
  end
  
  def play
    @board.render(@player1.cursor_pos)
    until @board.checkmate?(:white) || @board.checkmate?(:black)
      begin
        move = @player1.get_move
        @board.move(move[0], move[1])
        @board.render(@player2.cursor_pos)
        puts "CHECK!" if @board.in_check?(@player2.color)
      rescue RuntimeError => e
        puts e
        retry
      end
      begin
        move = @player2.get_move
        # @board.move(move[0], move[1])
        @board.move(move[0], move[1])
        @board.render(@player1.cursor_pos)
        puts "CHECK!" if @board.in_check?(@player1.color)
      rescue RuntimeError => e
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
