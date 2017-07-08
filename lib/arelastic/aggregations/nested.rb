module Arelastic
  module Aggregations
    class Nested < Arelastic::Aggregations::Bucket
      attr_accessor :path

      def initialize(name, path:, **options)
        super name, **options
        @path = path
      end

      def as_elastic_aggregation
        { "nested" => { "path" => path } }
      end
    end
  end
end
