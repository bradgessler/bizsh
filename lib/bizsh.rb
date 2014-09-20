require "bizsh/version"
require "pry"

module Bizsh
  # Numerics that we'll refine.
  NUMERIC_CLASSES = [Numeric, Float, Integer, Rational]

  # String formatting for better ouput.
  module Formatting

    # Default the number of decimal places we show in strings.
    DEFAULT_DECIMAL_PLACES = 2

    # Format a number into a percentage.
    FORMATTERS = {
      percent: -> (value, *args) do 
        value = value * 100
        value = FORMATTERS[:decimal].call(value, *args)
        [value, '%'].join
      end,
      decimal: -> (value, places: DEFAULT_DECIMAL_PLACES) do
        "%.#{places}f" % value.to_f
      end
    }

    # Refine multiple types.
    NUMERIC_CLASSES.each do |numeric|
      refine numeric do
        def to_s(format=nil, *args)
          if formatter = FORMATTERS[format]
            formatter.call(self, *args)
          else
            super()
          end
        end
      end
    end
  end

  # All of the functions we'll use to calculate stuff.
  module Functions
    NUMERIC_CLASSES.each do |numeric|
      refine numeric do
        # Calculate growth rates.
        def growth(present)
          past = self.to_f
          (present.to_f - past) / past
        end
      end
    end
  end

  # Take string-ish numbers, like dollar amounts numbers with commas, and 
  # convert into a ruby number.
  module ToNum
    refine String do
      def to_num
        # TODO - Make this work for folks that don't use ",'s" in their numbers.
        if match = self.match(/^\s*\$?\s*([\d\,]+)\.?(\d+)?\s*$/)
          whole, decimal = match.captures
          # Remove non-numeral out of the string.
          whole.gsub!(/[^\d]/, '')
          # Now cast it depending on if its a decimal value, or not.
          if whole && decimal
            [whole, '.', decimal].join.to_f
          elsif whole && !decimal
            whole.to_i
          end
        else
          0 # or should we just blow up?
        end
      end
    end
  end

  module Stocks
    refine String do
      require "stock_quote"

      def quote
        StockQuote::Stock.quote(self)
      end
    end
  end

  class REPL
    # REPL prompt.
    NAME = 'bizsh'

    # Refine all of our types.
    using Functions
    using Formatting
    using ToNum
    using Stocks

    # Start a REPL with refined types.
    def start
      Pry.hooks.clear_all # Remove default pry hooks.
      Pry.config.prompt = proc { |_, nest_level, _| "#{NAME}> " } # bizsh prompt.
      Pry.start binding # Fire up the REPL.
    end
  end
end