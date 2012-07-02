module Arelastic
  module Nodes
    class Or < Arelastic::Nodes::Node
      attr_reader :children

      def initialize children
        @children = children
      end
    end
  end
end