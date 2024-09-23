class Square 
  attr_accessor :contents
  attr_reader :name, :mark

  @@all = []
  @@top = "---"
  @@bottom = @@top
  @@r_side = "|"
  @@l_side = @@r_side
  def initialize(name)
    @name = name
    @default_contents = " "
    @contents = @default_contents
    @@all << self
  end
  
  def available? 
    @default_contents == @contents
  end
end