module Arelastic
  module Filters
    class Query < Arelastic::Filters::Filter
      attr_reader :expr
      def initialize(expr)
        @expr = expr.is_a?(String) ? {'query_string' => expr} : expr
      end

      def as_elastic
        {'query' => convert_to_elastic(expr)}
      end
    end
  end
end