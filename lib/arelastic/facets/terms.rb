module Arelastic
  module Facets
    class Terms < Arelastic::Facets::Facet
      attr_accessor :name, :field, :options
      def initialize name, field, options = {}
        @name = name
        @field = field
        @options = options
      end

      def as_elastic
        params = {"field" => field}.update(options)

        {
          name => {
            "terms" => params
          }
        }
      end
    end
  end
end