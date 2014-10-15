# encoding: utf-8

class Rook < SlidingPiece
  def render
    if color == :white
      '  ♖  '
    else
      '  ♜  '
    end
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