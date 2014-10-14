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


class SlidingPiece < Piece
  def moves
    moves = []
    self.move_dirs.each do |delta|
      (1..8).each do |i|
        x, y = [@pos[0] + i * delta[0], @pos[1] + i * delta[1]]
        
        if [x, y].nil?
          moves << [x, y]
        elsif board[x, y].color != @color
          moves << [x, y]
          break
        else
          break
        end
      end
    end
    
    moves.select { |move| valid_move?(move) }
  end
end

class SteppingPiece < Piece
  def moves
    moves = []
    self.move_dirs.each do |delta|  
      x, y = [@pos[0] + delta[0], @pos[1] + delta[1]]
    
      if [x, y].nil?
        moves << [x, y]
      elsif board[x, y].color != @color
        moves << [x, y]
        break
      else
        break
      end
    end
    
    moves.select { |move| valid_move?(move) }
  end
end

class Queen < SlidingPiece
  def render
    '  Q  '
  end
  
  def move_dirs
    [
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
  def render
    '  B  '
  end
  
  def move_dirs
    [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]
    
  end
end

class Rook < SlidingPiece
  def render
    '  R  '
  end
  
  def move_dirs
    [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ]
  end
end

class King < SteppingPiece
  def render
    '  K  '
  end
  
  def move_dirs
    [
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
  def render
    '  J  '
  end
  
  def move_dirs
    [
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
  
  def render
    '  P  '
  end
  
  def move_dirs
  end
end