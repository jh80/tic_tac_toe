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
end