module Arelastic
  module Sorts
    class GeoDistance < Arelastic::Sorts::Sort
      attr_accessor :field, :location, :options

      # GeoDistance.new('coordinates', [-70, 40]).as_elastic
      #  => {'_geo_distance' => {'coordinates' => [-70, 40]}}
      #
      # GeoDistance.new('coordinates', [-70, 40], 'distance_type' => 'plane').as_elastic
      #  => {'_geo_distance' => {'coordinates' => [-70, 40], 'distance_type' => 'plane'}}
      #
      def initialize(field, location, options = {})
        @field    = field
        @location = location
        @options  = options
      end

      def as_elastic
        {'_geo_distance' => {field => location}.update(options)}
      end
    end
  end
end