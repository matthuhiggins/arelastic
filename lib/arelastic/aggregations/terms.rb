module Arelastic
  module Aggregations
    class Terms < Arelastic::Aggregations::Aggregation
      def as_elastic_aggregation
        {"terms" => params}
      end
    end
  end
end
