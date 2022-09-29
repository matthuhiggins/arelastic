module Arelastic
  module Aggregations
    class Max < Arelastic::Aggregations::Aggregation
      def as_elastic_aggregation
        {'max' => options}
      end
    end
  end
end
