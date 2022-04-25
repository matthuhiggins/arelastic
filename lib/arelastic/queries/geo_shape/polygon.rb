# frozen_string_literal: true

module Arelastic
  module Queries
    module GeoShape
      class Polygon < Arelastic::Queries::Query
        attr_accessor :field, :points, :options

        def initialize(field, points, options = {})
          @field   = field
          @points  = points
          @options = options
        end

        def as_elastic
          params = {
            'shape' => { 'type' => 'polygon', 'coordinates' => [points] },
            'relation' => 'within'
          }.update(options)

          { 'geo_shape' => { field => params } }
        end
      end
    end
  end
end
