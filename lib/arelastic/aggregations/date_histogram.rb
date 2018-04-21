module Arelastic
  module Aggregations
    class DateHistogram < Arelastic::Aggregations::Bucket
      def as_elastic_aggregation
        {'date_histogram' => options}.merge(super)
      end
    end
  end
end
