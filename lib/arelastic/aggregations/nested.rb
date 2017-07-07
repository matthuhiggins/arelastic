module Arelastic
  module Aggregations
    class Nested < Arelastic::Aggregations::Aggregation
      include HasSubAggregations

      attr_accessor :path

      # HashGroup
      def initialize(name, path, aggs)
        super name
        @path = path
        @aggs = aggs
      end

      def as_elastic_aggregation
        sub_aggregations.merge!({ "nested" => options })
      end

      def options
        { "path" => path }
      end
    end
  end
end
