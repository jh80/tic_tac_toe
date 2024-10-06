# frozen_string_literal: true

# GameBoard hold the squares of the game and manages their contents

require './square'
require './print_design'

class GameBoard
  include PrintDesign

  attr_reader :squares, :any_sq_available

  def initialize(width, height = width)
    @width = width
    @height = height
    @squares = generate_squares
    @messages = {
      sq_not_available: "That square has already been chosen, pick an available square.\n\n",
      sq_not_found: <<~RUBY
        I could not find your square.#{' '}
        Make sure to use a LetterNumber format (ex: a1).
        Using the letters and numbers on the grid.\n
      RUBY
    }
  end

  def print_board
    print_column_numbers(@width)
    (0...(@height)).each do |row_num|
      print_row_letter(row_num)
      print_row_sqs(@width, row_num)
      row_num == (@height - 1) ? puts('') : print_row_divider(@width)
    end
  end

  # TO DO this is pretty much find_sq_by_name I don't think I need both- pick one
  def sq_index_from_name(sq_name)
    @squares.each_with_index do |square, index|
      return index if square.name == sq_name.downcase
    end
    puts 'I could not find your square. Alert programmer of issue.'
  end

  def find_sq_by_name(sq_name)
    @squares.each do |square|
      return square if square.name == sq_name.downcase
    end
    puts @messages[:sq_not_found]
  end

  # Alternate route, more efficient, less dynamic
  # def find_sq_by_name(sq_name, squares, width)
  #   row_num = width * (sq_name[0].to_i - 61)
  #   col_num = sq_name[1].to_i
  #   squares[row_num + col_num]
  # end

  # TO DO maybe get rid of find_by_sq_name method and use sq_index method

  def execute_pick(square_choice, player)
    return unless (square = find_sq_by_name(square_choice))
    return unless sq_available?(square)

    square.contents = player.mark
  end

  def sq_available?(square)
    return true if square.available?

    puts @messages[:sq_not_available]
    false
  end

  def any_sq_available?
    @squares.any? { |square| square.available? }
  end

  def generate_squares
    squares = []
    (@width * @height).times do |sq_num|
      squares << Square.new(sq_name_from_index(sq_num))
    end
    squares
  end

  def sq_name_from_index(index)
    row_letter = ((index / @width) + 97).chr
    col_num = (index % @width) + 1
    row_letter + col_num.to_s
  end
end
