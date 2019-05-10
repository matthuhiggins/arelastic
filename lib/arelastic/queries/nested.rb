module Arelastic
  module Queries
    class Nested < Arelastic::Queries::Query
      attr_accessor :path, :expr

      def initialize(path, expr)
        @path = path
        @expr = expr
      end

      def as_elastic
        params = {
          'path'   => path,
          'query'  => convert_to_elastic(expr)
        }

        { 'nested' => params }
      end

      def negate
        self.class.new(
          path,
          Arelastic::Queries::Bool.new must_not: self
        )
      end
    end
  end
end
