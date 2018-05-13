module Arelastic
  module Aggregations
    class Missing < Arelastic::Aggregations::Bucket
      def as_elastic_aggregation
        {'missing' => options}.merge(super)
      end
    end
  end
end
