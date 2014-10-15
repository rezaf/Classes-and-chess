class IllegalMoveError < RuntimeError
end
  
class Board
  attr_accessor :grid #, :color
  
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

  def render
    puts '   0    1    2    3    4    5    6    7  '
    @grid.each_with_index do |row, i|
      print "#{i}"
      row.each do |square|
        if square.nil?
          print "     "
        else
          print square.render
        end
      end
      puts
    end 
  end
end




# @grid[0][0]         = Rook.new(:white, self, # position)
#     @grid[0][7]     = Rook.new(:white, self, # position)
#     @grid[0][1]     = Knight.new(:white, self, # position)
#     @grid[0][6]     = Knight.new(:white, self, # position)
#     @grid[0][2]     = Bishop.new(:white, self, # position)
#     @grid[0][5]     = Bishop.new(:white, self, # position)
#     @grid[0][3]     = Queen.new(:white, self, # position)
#     @grid[0][4]     = King.new(:white, self, # position)


# @grid[7][0]         = Rook.new(:black)
#     @grid[7][7]     = Rook.new(:black)
#     @grid[7][1]     = Knight.new(:black)
#     @grid[7][6]     = Knight.new(:black)
#     @grid[7][2]     = Bishop.new(:black)
#     @grid[7][5]     = Bishop.new(:black)
#     @grid[7][3]     = Queen.new(:black)
#     @grid[7][4]     = King.new(:black)



# require 'io/console'
# require 'colorize'
#     @pointer_pos = [0, 0]
# def render
#   system("clear")
#   @grid.each_with_index.map do |row, rdex|
#     row.each_with_index.map do |column, cdex|
#       render_tile(row, column, rdex, cdex)
#     end.join("")
#   end.join("\n")
# end
#
# def render_tile(row, column, rdex, cdex)
#   background ||= ([row, column] == @pointer_pos ? :light_blue : nil)
#   if (rdex + cdex).even?
#     background ||= :black
#     '     '.colorize(:color => :white, :background => background)
#   else
#     background ||= :white
#     '  T  '.colorize(:color => :black, :background => background)
#   end
#