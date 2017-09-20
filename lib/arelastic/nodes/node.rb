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

      def stringify_options(options)
        options.each_with_object({}) { |(k, v), memo| memo[k.to_s] = v }
      end

      def ==(other)
        other.is_a?(Arelastic::Nodes::Node) && as_elastic == other.as_elastic
      end
    end
  end
end
