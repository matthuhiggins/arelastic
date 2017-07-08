module Arelastic
  module Aggregations
    class Min < Arelastic::Aggregations::Aggregation
      def as_elastic_aggregation
        {'min' => options}
      end
    end
  end
end
