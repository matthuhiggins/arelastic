module Arelastic
  module Facets
    class Terms < Arelastic::Facets::Facet
      attr_accessor :field, :options

      def initialize name, field, options = {}
        super name
        @field = field
        @options = options
      end

      def as_elastic_facet
        params = {"field" => field}.update(options)

        {
          "terms" => params
        }
      end
    end
  end
end