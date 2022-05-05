module Arelastic
  module Queries
    class GeoPolygon < Arelastic::Queries::Query
      attr_accessor :field, :points, :options

      def initialize(field, points, options = {})
        warn 'Arelastic::Queries::GeoPolygon is deprecated in Elastic Search 7.12;'
        + 'Use Arelastic::Queries::GeoShape instead.'
        @field   = field
        @points  = points
        @options = options
      end

      def as_elastic
        params = { field => { 'points' => points } }.update(options)

        { 'geo_polygon' => params }
      end
    end
  end
end
