module Arelastic
  module Aggregations
    class Histogram < Arelastic::Aggregations::Bucket
      def as_elastic_aggregation
        {'histogram' => options}
      end
    end
  end
end
