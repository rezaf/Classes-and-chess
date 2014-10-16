class IllegalMoveError < RuntimeError
end

class InputError < RuntimeError
end

class Board
  
  attr_accessor :grid
  
  def initialize(fill = true)
    @grid = Array.new (8) { Array.new (8) }
    setup_board if fill
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end
  
  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end
  
  def dup
    dup_board = Board.new(false)
    
    (0..7).each do |x|
      (0..7).each do |y|
        pos = [x, y]
        next if self[pos].nil?
        color = self[pos].color
        dup_board[pos] = self[pos].class.new(color, dup_board, pos)
      end
    end
    
    dup_board
  end
  
  def move(start, end_pos)
    if self[start].nil?
      raise IllegalMoveError.new('No piece at that position')
    end
    unless self[start].valid_moves.include?(end_pos)
      raise IllegalMoveError.new('Invalid move')
    end
    move!(start, end_pos)
  end

  def move!(start, end_pos)
    self[start].pos = end_pos
    self[start], self[end_pos] = nil, self[start]
  end
  
  def in_check?(color)
    opponent = (color == :white ? :black : :white)
    opponent_moves = find_pieces(opponent).map { |piece| piece.moves }.flatten
    
    opponent_moves.include?(find_king(color))
  end
  
  def checkmate?(color)
    in_check?(color) && find_pieces(color).all? { |piece| piece.moves.empty? }
  end
    
  def find_king(color)
    pieces.select { |piece| piece.is_a?(King) && piece.color == color }
  end
  
  def pieces
    @grid.flatten.compact
  end
  
  def find_pieces(color)
    pieces.select { |piece| piece.color == color }
  end
  
  def setup_board
    all_pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    def_col = [[0, :white], [7, :black]]

    def_col.each do |(x, color)|
      all_pieces.each_with_index do |piece, index|
        position = [x, index]
        self[position] = piece.new(color, self, position)
      end
    end
    
    (0..7).each do |y|
      self[[1, y]] = Pawn.new(:white, self, [1, y])
    end
    
    (0..7).each do |y|
      self[[6, y]] = Pawn.new(:black, self, [6, y])
    end
  end

  def render(cursor_pos)
    system("clear")
    @grid.each_with_index do |row, i|
      row.each_with_index do |square, j|
        background = :white if [i, j] == cursor_pos
        background ||= ((i + j).even? ? :light_blue : :yellow)
        if square.nil?
          print "     ".colorize(:background => background)
        else
          print square.render.colorize(:background => background)
        end
      end
      puts
    end 
  end
    
end



