module Arelastic
  module Filters
    class GeoDistance < Arelastic::Filters::Filter
      attr_accessor :field, :distance, :location, :options
      def initialize(field, distance, location, options = {})
        @field = field
        @distance = distance
        @location = location
        @options = options
      end

      def as_elastic
        params = { "distance" => distance, field => location }.update(options)

        { "geo_distance" => params }
      end
    end
  end
end