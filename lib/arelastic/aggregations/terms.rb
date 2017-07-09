module Arelastic
  module Aggregations
    class Terms < Arelastic::Aggregations::Bucket
      def as_elastic_aggregation
        {'terms' => options}
      end
    end
  end
end
