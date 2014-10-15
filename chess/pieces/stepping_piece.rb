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