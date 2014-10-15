class Pawn < Piece
  
  def render
    '  P  '
  end
  
  def move_dirs
    case @color
    when :white
      [[1, 0], [1, -1], [1, 1]]
    when :black
      [[-1, 0], [-1, 1], [-1, -1]]
    end
  end
  
  def moves
    move_set = []

    x, y = move_dirs[0][0] + @pos[0], move_dirs[0][1] + @pos[1]
    
    move_set << [x, y] if @board[[x, y]].nil?
    
    move_dirs[1..2].each do |delta|
      x, y = delta[0] + @pos[0], delta[1] + @pos[1]
      move_set << [x, y] unless (board[[x, y]].nil? || board[[x, y]].color == @color) 
    end
    move_set

    # move_set.select { |move| valid_move?(move) }
  end
end

begin
  # code goes here
rescue
  # error handling
  # retry
end