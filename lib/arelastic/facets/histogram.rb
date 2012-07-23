module Arelastic
  module Facets
    class Histogram < Arelastic::Facets::Facet
      attr_accessor :name, :options
      def initialize name, options
        @name = name
        @options = options
      end

      def as_elastic
        {
          name => {
            "histogram" => options
          }
        }
      end
    end
  end
end