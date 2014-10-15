class SlidingPiece < Piece
  def moves
    move_set = []
    self.move_dirs.each do |delta|
      (1..8).each do |i|
        x, y = [@pos[0] + i * delta[0], @pos[1] + i * delta[1]]
        next unless [x, y].all? { |i| i.between?(0, 7) }
        
        if board[[x, y]].nil?
          move_set << [x, y]
        elsif board[[x, y]].color != @color
          move_set << [x, y]
          break
        else
          break
        end
      end
    end
    
    move_set
    # move_set.select { |move| valid_move?(move) }
  end
end