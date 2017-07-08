module Arelastic
  module Aggregations
    class ReverseNested < Arelastic::Aggregations::Bucket
      attr_accessor :path

      def initialize(name, path = nil, aggs)
        super name, aggs: aggs
        @path = path
      end

      def as_elastic_aggregation
        params = path ? { "path" => path } : {}

        { "reverse_nested" => params }
      end
    end
  end
end
