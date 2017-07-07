module Arelastic
  module Aggregations
    class DateHistogram < Arelastic::Aggregations::Aggregation
      include Arelastic::Aggregations::HasSubAggregations

      def initialize(name, options = {}, aggs: [])
        super name, options
        @aggs = aggs
      end

      def as_elastic_aggregation
        sub_aggregations.merge!({'date_histogram' => options})
      end
    end
  end
end
