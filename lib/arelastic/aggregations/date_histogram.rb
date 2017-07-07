module Arelastic
  module Aggregations
    class DateHistogram < Arelastic::Aggregations::BucketAggregation
      def as_elastic_aggregation
        base_bucket_aggregation.merge!({'date_histogram' => options})
      end
    end
  end
end
