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