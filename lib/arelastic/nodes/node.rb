module Arelastic
  module Nodes
    class Node
      extend Arelastic::Arities::Binary
      extend Arelastic::Arities::Polyadic
      extend Arelastic::Arities::Unary

      def convert_to_elastic(expr)
        if expr.is_a?(Array)
          expr.map { |e| convert_to_elastic(e) }
        else
          expr.respond_to?(:as_elastic) ? expr.as_elastic : expr
        end
      end

      def as_elastic
        {}
      end

      def ==(other)
        as_elastic == other.as_elastic
      end
    end
  end
end
