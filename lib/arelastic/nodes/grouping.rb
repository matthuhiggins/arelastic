module Arelastic
  module Nodes
    class Grouping < Arelastic::Nodes::Node
      attr_accessor :nodes
      def initialize nodes
        @nodes = nodes
      end

      def as_elastic
        p "nodes = #{nodes.inspect}"
        result = {}
        nodes.each do |node|
          p "converting #{node.inspect}"
          result.merge! convert_to_elastic(node)
        end
        result
      end
    end
  end
end