class IllegalMoveError < RuntimeError
end
  
class Board
  attr_accessor :grid, :color
  
  def initialize
    @grid = Array.new (8) { Array.new (8) } 
    setup_board
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end
  
  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end
  
  def move(start, end_pos)

    if @grid[start].nil?
      raise IllegalMoveError.new('No piece at that position') 
    end    
    unless @grid[start].moves.include?(end_pos)
      raise IllegalMoveError.new('Invalid move') 
    end
    
    @grid[start], @grid[end_pos] = @grid[end_pos], nil # this will be in move!
  end
  
  def valid_move?(move)
    move.all? { |coord| coord.between?(0, 7) }
  end
  
  def in_check?(color)
    opponent = (color == :white ? :black : :white)
    opponent_moves = find_pieces(opponent).map { |piece| piece.moves }.flatten
    
    opponent_moves.include?(find_king(color))
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
  
  def setup

    all_pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    def_col = [[0, :white], [7, :black]]

    def_col.each do |row, color|
      all_pieces.each do |klass|
        klass.new()

  [[0, :white], [7, :black]].each do |(x, color)|
    all_pieces.each_with_index do |piece, index|
      @grid[x][]
        end
      end
    end
  end

  def setup_board
    @grid[1].map! { Pawn.new(:white, self, # position) }
    @grid[0][0] = Rook.new(:white, self, # position)
    @grid[0][7] = Rook.new(:white, self, # position)
    @grid[0][1] = Knight.new(:white, self, # position)
    @grid[0][6] = Knight.new(:white, self, # position)
    @grid[0][2] = Bishop.new(:white, self, # position)
    @grid[0][5] = Bishop.new(:white, self, # position)
    @grid[0][3] = Queen.new(:white, self, # position)
    @grid[0][4] = King.new(:white, self, # position)

    @grid[6].map! { Pawn.new(:black) }
    @grid[7][0] = Rook.new(:black)
    @grid[7][7] = Rook.new(:black)
    @grid[7][1] = Knight.new(:black)
    @grid[7][6] = Knight.new(:black)
    @grid[7][2] = Bishop.new(:black)
    @grid[7][5] = Bishop.new(:black)
    @grid[7][3] = Queen.new(:black)
    @grid[7][4] = King.new(:black)
  end
  
  def render
    @grid.each do |row|
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






require 'io/console'
require 'colorize'
    @pointer_pos = [0, 0]
def render
  system("clear")
  @grid.each_with_index.map do |row, rdex|
    row.each_with_index.map do |column, cdex|
      render_tile(row, column, rdex, cdex)
    end.join("")
  end.join("\n")
end

def render_tile(row, column, rdex, cdex)
  background ||= ([row, column] == @pointer_pos ? :light_blue : nil)
  if (rdex + cdex).even?
    background ||= :black
    '     '.colorize(:color => :white, :background => background)
  else
    background ||= :white
    '  T  '.colorize(:color => :black, :background => background)
  end
  