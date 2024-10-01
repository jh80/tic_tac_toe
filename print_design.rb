module PrintDesign 
  def cat 
    puts "  ^   ^"
    puts "( >'.'< )"
    puts "  m   m"
  end

  def row_divider(width)
    print " "
    (1..width).each {print ' ---'}
    puts ""
  end

  def column_numbers(width) 
    (0...(width)).each {|column_num| print "   #{column_num + 1}"}
    puts ""
  end
end