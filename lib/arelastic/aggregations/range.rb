module Arelastic
  module Aggregations
    class Range < Arelastic::Aggregations::Bucket
      def as_elastic_aggregation
        {'range' => options}.merge(super)
      end
    end
  end
end
