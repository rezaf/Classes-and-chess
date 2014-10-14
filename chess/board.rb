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
  
  def valid_move?(move)
    move.all? { |coord| coord.between?(0, 7) }
  end
  
  all_pieces = [Pawn, Rook, Knight, Bishop, Queen, King]
  def_col = [[0, :white], [7, :black]]
  
  def setup_board
    @grid[1].map! { Pawn.new(:white) }
    @grid[0][0] = Rook.new(:white)
    @grid[0][7] = Rook.new(:white)
    @grid[0][1] = Knight.new(:white)
    @grid[0][6] = Knight.new(:white)
    @grid[0][2] = Bishop.new(:white)
    @grid[0][5] = Bishop.new(:white)
    @grid[0][3] = Queen.new(:white)
    @grid[0][4] = King.new(:white)

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

#require 'io/console'
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
  