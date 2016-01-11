module Arelastic
  module Filters
    class GeoBoundingBox < Arelastic::Filters::Filter
      attr_accessor :field, :top_left, :bottom_right, :options
      def initialize(field, options)
        @field = field
        options = options.dup
        @top_left = options.delete(:top_left) || (raise "missing :top_left")
        @bottom_right = options.delete(:bottom_right) || (raise "missing :bottom_right")
        @options = options
      end

      def as_elastic
        params = options.update field => {
          "top_left"     => top_left,
          "bottom_right" => bottom_right
        }

        { "geo_bounding_box" => params }
      end
    end
  end
end