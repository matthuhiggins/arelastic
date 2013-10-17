module Arelastic
  module Facets
    class Nested < Struct.new :path, :facet
      def as_elastic
        facet.as_elastic.merge("nested" => path)
      end
    end
  end
end