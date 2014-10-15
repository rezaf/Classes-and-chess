class Piece
  attr_reader :board
  attr_accessor :pos, :color
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
  
  #We have two valid_move? methods.
  def valid_move?(move)
    check = move.all? { |coord| coord.between?(0, 7) }
    check && !move_into_check?(move)
  end
  
  def move_into_check?(move)
    # dup board
    test_board = board.dup
    clone = test_board[@pos]
    # make each move
    test_board.move!(clone.pos, move)
    # test if player in check
    test_board.in_check?(clone.color)
  end
end