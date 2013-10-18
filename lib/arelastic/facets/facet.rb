module Arelastic
  module Facets
    class Facet < Arelastic::Nodes::Node
      attr_reader :name

      def initialize name
        @name = name
      end

      def as_elastic
        { name => as_elastic_facet }
      end

      def nested path
        Facets::Nested.new path, self
      end
    end
  end
end