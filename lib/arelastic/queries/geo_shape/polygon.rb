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
          { field => { 'type' => 'Polygon', 'coordinates' => points } }.update(options)
        end
      end
    end
  end
end
