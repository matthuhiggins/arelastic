module Arelastic
  module Nodes
    class Node
      extend Arelastic::Arities::Binary
      extend Arelastic::Arities::Polyadic
      extend Arelastic::Arities::Unary

      def convert_to_elastic(expr)
        expr.respond_to?(:as_elastic) ? expr.as_elastic : expr
      end

      def ==(other)
        as_elastic == other.as_elastic
      end
    end
  end
end
