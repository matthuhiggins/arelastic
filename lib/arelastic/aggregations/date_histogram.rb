module Arelastic
  module Aggregations
    class DateHistogram < Arelastic::Aggregations::Aggregation
      def as_elastic_aggregation
        {'date_histogram' => options}
      end
    end
  end
end