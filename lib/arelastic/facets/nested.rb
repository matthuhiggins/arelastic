module Arelastic
  module Facets
    class Nested < Arelastic::Facets::Facet
      attr_reader :path, :facet

      def initialize path, facet
        super facet.name
        @path = path
        @facet = facet
      end

      def as_elastic_facet
        facet.as_elastic_facet.merge("nested" => path)
      end
    end
  end
end