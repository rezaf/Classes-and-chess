# encoding: utf-8

class Bishop < SlidingPiece
  def render
    if color == :white
      '  ♗  '
    else
      '  ♝  '
    end
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