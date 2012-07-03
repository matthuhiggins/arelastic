module Arelastic
  module Nodes
    class Node
      extend Arelastic::Arities::Binary
      extend Arelastic::Arities::Polyadic
      extend Arelastic::Arities::Unary

      def convert_to_elastic(val)
        val.respond_to?(:to_elastic) ? val.to_elastic : val
      end
    end
  end
end