# encoding: utf-8

class Knight < SteppingPiece
  def render
    if color == :white
      '  ♘  '
    else
      '  ♞  '
    end
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