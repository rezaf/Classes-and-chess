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
      @board.render
      puts "CHECK!" if @board.in_check?(@player1.color)
      @board.move(@player1.get_move)
      puts "CHECK!" if @board.in_check?(@player2.color)
      @board.move(@player2.get_move)
    end
    
    puts "CHECKMATE!"
  end

end


class HumanPlayer
  attr_reader :color, :name
  
  def initialize(name, color)
    @name = name
    @color = color
  end
  
  def get_move
    puts "#{name}, move piece from where? (x, y)"
    from = gets.chomp.split(',').map { |digit| digit.to_i }
    puts "#{name}, move to where? (x, y)"
    to = gets.chomp.split(',').map { |digit| digit.to_i }
    [from, to]
  end
  
end