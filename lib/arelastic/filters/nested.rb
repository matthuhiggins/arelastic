module Arelastic
  module Filters
    class Nested < Arelastic::Filters::Filter
      attr_accessor :path, :expr
      def initialize(path, expr)
        @path = path
        @expr = expr
      end

      def as_elastic
        {
          'nested' => {
            'path'  => path,
            'query' => convert_to_elastic(expr)
          }
        }
      end
    end
  end
end