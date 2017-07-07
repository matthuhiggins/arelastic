module Arelastic
  module Aggregations
    class Nested < Arelastic::Aggregations::Aggregation
      include Arelastic::Nodes::HasAggregations

      attr_accessor :path

      def initialize(name, path, aggs)
        super name
        @path = path
        @aggs = aggs
      end

      def as_elastic_aggregation
        aggs_as_elastic.merge!({ "nested" => options })
      end

      def options
        { "path" => path }
      end
    end
  end
end
