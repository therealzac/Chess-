require 'colorize'
require_relative 'cursorable.rb'
require_relative 'board.rb'
require_relative 'piece.rb'

class Display
  include Cursorable

  attr_accessor :cursor, :board

  def initialize(board = Board.new)
    @board = board
    @cursor = [0, 0]
  end

  def render
    @board.grid.each_with_index do |row, x|
      row.each_with_index do |tile, y|
        if [x,y] == @cursor
          print tile_type(tile).colorize(:yellow)
        else
          print tile_type(tile)
        end
      end
      puts
    end
    nil
  end

  def tile_type(tile)
    return tile.token if tile.class == Piece
    "[ ]"
  end

end
