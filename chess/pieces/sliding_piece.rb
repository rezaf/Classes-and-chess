class SlidingPiece < Piece
  def moves
    moves = []
    self.move_dirs.each do |delta|
      (1..8).each do |i|
        x, y = [@pos[0] + i * delta[0], @pos[1] + i * delta[1]]
        
        if [x, y].nil?
          moves << [x, y]
        elsif board[x, y].color != @color
          moves << [x, y]
          break
        else
          break
        end
      end
    end
    
    moves.select { |move| valid_move?(move) }
  end
end