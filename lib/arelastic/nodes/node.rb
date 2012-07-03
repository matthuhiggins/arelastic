module Arelastic
  module Nodes
    class Node
      extend Arelastic::Arities::Binary
      extend Arelastic::Arities::Polyadic
      extend Arelastic::Arities::Unary

      def convert_to_elastic(expr)
        expr.respond_to?(:as_elastic) ? expr.as_elastic : expr
      end
    end
  end
end
