module Arelastic
  module Aggregations
    class Nested < Arelastic::Aggregations::Aggregation
      attr_accessor :path, :aggregations

      # HashGroup
      def initialize name, path, aggregations
        super name
        @path = path
        @aggregations = aggregations
      end

      def as_elastic
        grouping = Arelastic::Nodes::HashGroup.new aggregations
        {
          name => {
            "nested" => {"path" => path},
            "aggs"   => grouping.as_elastic
          }
        }
      end
    end
  end
end
