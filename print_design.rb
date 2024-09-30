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
end