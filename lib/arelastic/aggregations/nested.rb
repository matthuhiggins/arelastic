module Arelastic
  module Aggregations
    class Nested < Arelastic::Aggregations::Aggregation
      attr_accessor :path, :aggs

      # HashGroup
      def initialize name, path, aggs
        super name
        @path = path
        @aggs = aggs
      end

      def as_elastic_aggregation
        {
          "nested" => {"path" => path},
          "aggs"   => convert_to_elastic(aggs)
        }
      end
    end
  end
end
