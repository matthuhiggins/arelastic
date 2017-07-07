module Arelastic
  module Searches
    class Aggregations < Arelastic::Searches::Search
      attr_accessor :aggregations
      def initialize *aggregations
        @aggregations = aggregations.flatten
      end

      def as_elastic
        grouping = Arelastic::Nodes::HashGroup.new aggregations.flatten
        { "aggs" => grouping.as_elastic }
      end

      def nested(name, path)
        Arelastic::Aggregations::Nested.new name, path, aggregations
      end

      def reverse_nested(name, path = nil)
        Arelastic::Aggregations::ReverseNested.new name, path, aggregations
      end
    end
  end
end
