module Arelastic
  module Facets
    class Nested < Struct.new :parent, :facet
      def as_elastic
        facet.as_elastic.merge("nested" => parent)
      end
    end
  end
end