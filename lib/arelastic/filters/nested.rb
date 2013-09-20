module Arelastic
  module Filters
    class Nested < Arelastic::Filters::Filter
      attr_accessor :path, :expr
      def initialize(path, expr)
        @path = path
        @expr = expr
      end

      def as_elastic
        params = {'path' => path}.update(convert_to_elastic(expr))

        { 'nested' => params }
      end
    end
  end
end