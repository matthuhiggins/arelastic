module Arelastic
  module Nodes
    class HashGroup < Arelastic::Nodes::Node
      attr_accessor :nodes
      def initialize nodes
        @nodes = nodes
      end

      def as_elastic
        nodes.each_with_object({}) do |node, result|
          result.merge! convert_to_elastic(node)
        end
      end
    end
  end
end
