module Arelastic
  module Facets
    class DateHistogram < Arelastic::Facets::Facet
      attr_accessor :options

      def initialize name, options
        super name
        @options = options
      end

      def as_elastic_facet
        {
          "date_histogram" => options
        }
      end
    end
  end
end
