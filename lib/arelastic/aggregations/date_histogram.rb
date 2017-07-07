module Arelastic
  module Aggregations
    class DateHistogram < Arelastic::Aggregations::Aggregation
      include Arelastic::Nodes::HasAggregations

      def initialize(name, options = {}, aggs: [])
        super name, options
        @aggs = aggs
      end

      def as_elastic_aggregation
        aggs_as_elastic.merge!({'date_histogram' => options})
      end
    end
  end
end
