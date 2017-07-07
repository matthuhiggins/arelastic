module Arelastic
  module Aggregations
    class Terms < Arelastic::Aggregations::Aggregation
      include Arelastic::Nodes::HasAggregations

      def as_elastic_aggregation
        aggs_as_elastic.merge!({'terms' => options})
      end
    end
  end
end
