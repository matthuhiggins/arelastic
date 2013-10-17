module Arelastic
  module Facets
    class Facet < Arelastic::Nodes::Node
      def nested parent
        Facets::Nested.new parent, self
      end
    end
  end
end