module Arelastic
  module Searches
    class Unary
      attr_accessor :expr
      def initialize(expr)
        @expr = expr
      end
    end
  end
end