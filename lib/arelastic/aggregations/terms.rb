module Arelastic
  module Aggregations
    class Terms < Arelastic::Aggregations::BucketAggregation
      def as_elastic_aggregation
        base_bucket_aggregation.merge!({'terms' => options})
      end
    end
  end
end
