module Arelastic
  module Aggregations
    class Sum < Arelastic::Aggregations::Aggregation
      def as_elastic_aggregation
        {'sum' => options}
      end
    end
  end
end
