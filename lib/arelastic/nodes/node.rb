module Arelastic
  module Nodes
    class Node
      extend Arelastic::Arities::Binary
      extend Arelastic::Arities::Polyadic
      extend Arelastic::Arities::Unary

      def convert_to_elastic(expr)
        if expr.is_a?(Array)
          expr.uniq.map { |e| convert_to_elastic(e) }
        elsif expr.is_a?(Hash)
          expr.transform_values { |e| convert_to_elastic(e) }
        else
          expr.respond_to?(:as_elastic) ? expr.as_elastic : expr
        end
      end

      def read_option!(options, key)
        options.delete(key) || options.delete(key.to_sym)
      end

      def ==(other)
        other.is_a?(Arelastic::Nodes::Node) && as_elastic == other.as_elastic
      end
    end
  end
end
