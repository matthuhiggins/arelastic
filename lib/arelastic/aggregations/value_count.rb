module Arelastic
  module Aggregations
    class ValueCount < Arelastic::Aggregations::Aggregation
      def as_elastic_aggregation
        {'value_count' => options}
      end
    end
  end
end
