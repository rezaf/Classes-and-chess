class Piece
  attr_reader :board
  attr_accessor :pos, :color
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
  
  def valid_move?(move)
    move.all? { |coord| coord.between?(0, 7) }
  end
end