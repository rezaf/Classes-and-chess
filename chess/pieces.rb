class Piece
  attr_reader :color, :board
  attr_accessor :pos
  
  def initialize
    
  end
  
end


class SlidingPiece < Piece
  def moves(&blk)
    deltas = []
    
    DELTAS = 
    
    blk = &blk
    blk.call
    
    # get array of moves , check directions in subclass
  end
end

class SteppingPiece < Piece
  def moves
    
  end
end

class Queen < SlidingPiece
  def move_dirs
    DELTAS = [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1],
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ]
  end
end

class Bishop < SlidingPiece
  def move_dirs
    DELTAS = [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]
    
  end
end

class Rook < SlidingPiece
  def move_dirs
    DELTAS = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ]
  end
end

class King < SteppingPiece
  def move_dirs
    DELTAS = [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1],
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ]
  end
end

class Knight < SteppingPiece
  def move_dirs
    DELTAS = [
      [1, 2],
      [2, 1],
      [2, -1],
      [-1, 2],
      [-2, 1],
      [-2, -1],
      [-1, -2],
      [1, -2]
    ]
  end
end

class Pawn < Piece
end