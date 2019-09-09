module Arelastic
  module Aggregations
    class Cardinality < Arelastic::Aggregations::Aggregation
      def as_elastic_aggregation
        {'cardinality' => options}
      end
    end
  end
end
