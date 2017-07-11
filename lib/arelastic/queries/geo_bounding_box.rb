module Arelastic
  module Queries
    class GeoBoundingBox < Arelastic::Queries::Query
      attr_accessor :field, :bounds, :options
      def initialize(field, bounds, options = {})
        @field    = field
        @bounds   = bounds
        @options  = options
      end

      def as_elastic
        params = {field => bounds}.update(options)

        { "geo_bounding_box" => params }
      end
    end
  end
end