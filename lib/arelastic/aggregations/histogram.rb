module Arelastic
  module Aggregations
    class Histogram < Arelastic::Aggregations::Bucket
      def as_elastic_aggregation
        {'histogram' => options}.merge(super)
      end
    end
  end
end
