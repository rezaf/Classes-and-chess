class Piece
  attr_reader :board
  attr_accessor :pos, :color
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def valid_moves
    moves.select { |move| !move_into_check?(move) }
  end
  
  def move_into_check?(move)
    test_board = board.dup
    clone = test_board[@pos]
    test_board.move!(clone.pos, move)
    test_board.in_check?(clone.color)
  end
end