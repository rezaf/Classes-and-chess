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