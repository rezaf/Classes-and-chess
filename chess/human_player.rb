class HumanPlayer
  attr_reader :color, :name
  
  def initialize(name, color)
    @name = name
    @color = color
  end
  
  def get_move
    puts "#{name}, move piece from where? (x, y)"
    from = gets.chomp.split(',').map { |digit| digit.to_i }
    puts "#{name}, move to where? (x, y)"
    to = gets.chomp.split(',').map { |digit| digit.to_i }
    [from, to]
  end
end