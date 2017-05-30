require "linearregression/version"

module Linear
  class Regression
    attr_reader :x, :y
    def initialize(h = {})
      @x=h.keys
      @y=h.values
    end

    def []=(key,value)
      return if key.nil? or value.nil?
      @x.push key
      @y.push value
    end

    def projection(p = 1)
      s = slope(x,y) 
      #debug
      puts "y = #{s[:a]} + #{s[:b]} * #{p}"
      (s[:a] + s[:b] * p).round(2)
    end

  private
    def slope(x,y)
      exy = xy(x, y).reduce(:+)
      n = x.size.to_f
      ex_2 = x.inject(0) {|s,n| s + n**2}

      mx = (x.reduce(:+) / n)
      my = (y.reduce(:+) / n)

      #angular coefficient 
      ac = (exy - (n * mx * my)) / (ex_2 - (n * mx**2))
      #linear coefficient
      lc = my - (ac * mx)
      {a: lc, b: ac}
    end

    def xy(x, y)
      result = []
      x.each_with_index {|n,i| result << n * y[i]}
      result
    end
  end
end
