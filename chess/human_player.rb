class HumanPlayer
  attr_reader :color, :name
  attr_accessor :cursor_pos
  
  def initialize(name, color, board)
    @name = name
    @color = color
    @cursor_pos = [5, 5]
    @board = board
  end
  
  def get_move
    from = select_pos
    to = select_pos
    [from, to]
  end
  
  def cursor_dir(input)
    case input
    when 'w' then :up
    when 's' then :down
    when 'a' then :left
    when 'd' then :right 
    when 'q' then exit
    end
  end

  def move_cursor(dir)
    diff = case dir
    when :up then [-1, 0]
    when :down then [1, 0]
    when :right then [0, 1]
    when :left then [0, -1]
    end
    dx, dy = diff
    self.cursor_pos = [cursor_pos[0] + dx, cursor_pos[1] + dy]
  end
  
  def select_pos
    until (input = STDIN.getch) == ' '
      unless ['w', 'a', 's', 'd', 'q', ' '].include?(input)
        raise InputError.new('Invalid Keystroke (W, A, S, D, Space)')
      end
      move_cursor(cursor_dir(input))
      @board.render(cursor_pos)
    end
    cursor_pos
  end
    
    
    
    
    
    # puts "#{name}, move piece from where? (x, y)"
    # from = gets.chomp.split(',').map { |digit| digit.to_i }
    # puts "#{name}, move to where? (x, y)"
    # to = gets.chomp.split(',').map { |digit| digit.to_i }
    # [from, to]

end