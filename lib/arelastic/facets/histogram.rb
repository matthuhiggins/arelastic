module Arelastic
  module Facets
    class Histogram < Arelastic::Facets::Facet
      attr_accessor :options

      def initialize name, options
        super name
        @options = options
      end

      def as_elastic_facet
        {
          "histogram" => options
        }
      end
    end
  end
end