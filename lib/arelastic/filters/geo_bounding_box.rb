module Arelastic
  module Filters
    class GeoBoundingBox < Arelastic::Filters::Filter
      attr_accessor :field, :top_left, :bottom_right, :options
      def initialize(field, top_left, bottom_right, options = {})
        @field = field
        @top_left = top_left
        @bottom_right = bottom_right
        @options = options
      end

      def as_elastic
        params = {field => {"top_left" => top_left, "bottom_right" => bottom_right}}.update(options)

        { "geo_bounding_box" => params }
      end
    end
  end
end