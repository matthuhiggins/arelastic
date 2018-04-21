module Arelastic
  module Aggregations
    class Terms < Arelastic::Aggregations::Bucket
      def as_elastic_aggregation
        {'terms' => options}.merge(super)
      end
    end
  end
end
