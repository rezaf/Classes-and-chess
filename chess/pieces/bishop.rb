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