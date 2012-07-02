module Arelastic
  module Nodes
    class Or < Arelastic::Nodes::Node
      attr_reader :children

      def initialize children
        @children = children
      end

      def as_elastic
        children.map { |child| child.as_elastic }
      end
    end
  end
end