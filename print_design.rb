module PrintDesign 
  def cat 
    puts "  ^   ^"
    puts "( >'.'< )"
    puts "  m   m"
  end

  def row_divider(width)
    puts ""
    print " "
    (1..width).each {print ' ---'}
    puts ""
  end
end