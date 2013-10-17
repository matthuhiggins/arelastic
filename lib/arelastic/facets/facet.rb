module Arelastic
  module Facets
    class Facet < Arelastic::Nodes::Node
      def nested path
        Facets::Nested.new path, self
      end
    end
  end
end