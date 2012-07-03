module Arelastic
  module Filters
    class Not < Arelastic::Filter
      attr_reader :expr

      def initialize expr
        @expr = expr
      end

      def as_elastic
        {"not" => convert_to_elastic(expr)}
      end
    end
  end
end