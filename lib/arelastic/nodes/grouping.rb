module Arelastic
  module Nodes
    class Grouping < Arelastic::Nodes::Node
      attr_accessor :nodes
      def initialize nodes
        @nodes = nodes
      end

      def as_elastic
        result = {}
        nodes.each { |node| result.merge! convert_to_elastic(node) }
        result
      end
    end
  end
end