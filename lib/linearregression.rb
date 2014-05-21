require "linearregression/version"

module Linearregression
  class Regression
    attr_reader :x, :y
    def initialize(x: Array.new, y: Array.new)
      @x=x
      @y=y
    end

    def make(project=1)
      raise "the X and Y values should be equal size." if x.size != y.size
    
      s = slope(x,y) 
      puts "y = #{s[:a].round(2)}x + #{s[:b].round(2)}"

      s[:a].round(2) * project + s[:b].round(2)
    end

  private
    def slope(x,y)
      exy = xy(x, y).reduce(:+)
      n = x.size.to_f
      ex_2 = x.inject(0) {|s,n| s + n**2}

      mx = (x.reduce(:+) / n)
      my = (y.reduce(:+) / n)

      #sloop 
      b = (exy - (n * mx * my)) / (ex_2 - (n * mx**2))
      #linear coefficient
      a = my - (b * mx)
      {a: a, b: b}
    end

    def xy(x, y)
      result = []
      x.each_with_index {|n,i| result << n * y[i]}
      result
    end
  end
end
