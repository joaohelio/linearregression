require "linearregression/version"
require 'bigdecimal'
require 'date'

module Linear
  class Regression

    def initialize(data)
      @x = data.keys
      @y = data.values.map { |value| BigDecimal(value) }
    end

    private

    attr_reader :x, :y

    public def projection(value)
      return raise 'invalid value' unless value.is_a? Integer

      s = slope(x, y)

      # y = #{s[:a]} + #{s[:b]} * #{value}
      (s[:a] + s[:b] * value).round(2)
    end

    def slope(x, y)
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

    def []=(key, value)
      return if key.nil? || value.nil?

      @x.push key
      @y.push value
    end

  end
end
