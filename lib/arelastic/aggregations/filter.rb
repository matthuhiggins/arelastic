module Arelastic
  module Aggregations
    class Filter < Arelastic::Aggregations::Aggregation
      include Arelastic::Nodes::HasAggregations

      attr_accessor :filter

      def initialize(name, filter, options = {})
        super name, options
        @filter = filter
      end

      def as_elastic_aggregation
        aggs_as_elastic.merge!({'filter' => convert_to_elastic(filter)})
      end
    end
  end
end
