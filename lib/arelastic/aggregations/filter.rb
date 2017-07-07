module Arelastic
  module Aggregations
   class Filter < Arelastic::Aggregations::Aggregation
     include Arelastic::Aggregations::HasSubAggregations

      attr_accessor :filter

      def initialize(name, filter, aggs: [])
        super name
        @filter = filter
        @aggs = aggs
      end

      def as_elastic_aggregation
        sub_aggregations.merge!({'filter' => convert_to_elastic(filter)})
      end
    end
  end
end
