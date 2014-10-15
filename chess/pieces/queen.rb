# encoding: utf-8

class Queen < SlidingPiece
  def render
    if color == :white
      '  ♕  '
    else
      '  ♛  '
    end
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