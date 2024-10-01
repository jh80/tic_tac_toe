module PrintDesign 
  def print_cat 
    puts "  ^   ^"
    puts "( >'.'< )"
    puts "  m   m"
  end

  def print_row_divider(width)
    print " "
    (1..width).each {print ' ---'}
    puts ""
  end

  def print_column_numbers(width) 
    (0...(width)).each {|column_num| print "   #{column_num + 1}"}
    puts ""
  end

  def print_row_sqs(width, row_num) 
    (0...width).each do |column_num|
      print " #{squares[(row_num * width) + column_num].contents}"
      column_num == (width - 1) ? puts("") : print(' |')  
    end
  end
end