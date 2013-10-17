module Arelastic
  module Facets
    class Nested < Struct.new :path, :facet
      def as_elastic
        original = facet.as_elastic
        name = original.keys.first
        {
          name => original[name].merge("nested" => path)
        }
      end
    end
  end
end