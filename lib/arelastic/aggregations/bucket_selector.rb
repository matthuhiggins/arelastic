module Arelastic
  module Aggregations
    class BucketSelector < Arelastic::Aggregations::Aggregation
      def as_elastic_aggregation
        { 'bucket_selector' => options }
      end
    end
  end
end
