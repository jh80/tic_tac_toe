# frozen_string_literal: true

# Print design holds ascii designs that will print
module PrintDesign
  private

  def print_cat
    puts '  ^   ^'
    puts "( >'.'< )"
    puts '  m   m'
  end

  def print_row_divider(width)
    print ' '
    (1..width).each { print ' ---' }
    puts ''
  end

  def print_column_numbers(width)
    (0...(width)).each { |column_num| print "   #{column_num + 1}" }
    puts ''
  end

  # TO DO should I make squares a parameter? the method cannot be used by an object that doesn't have a list of sqs
  # Maybe I should just make a null case - if no squares list with squares with contents - then just
  # print a space or return an error, i guess aka use an error handler
  def print_row_sqs(width, row_num)
    (0...width).each do |column_num|
      print " #{squares[(row_num * width) + column_num].contents}"
      column_num == (width - 1) ? puts('') : print(' |')
    end
  end

  def print_row_letter(row_num, extra = ' ')
    row_letter = (row_num + 97).chr
    print row_letter + extra
  end
end
