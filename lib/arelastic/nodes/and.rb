module Arelastic
  module Nodes
    class And < Arelastic::Nodes::Node
      attr_reader :children

      def initialize children
        @children = children
      end
    end
  end
end