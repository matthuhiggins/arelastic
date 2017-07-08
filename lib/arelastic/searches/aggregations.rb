module Arelastic
  module Searches
    class Aggregations < Arelastic::Searches::Search
      include Arelastic::Nodes::HasAggregations

      def initialize *aggs
        @aggs = aggs.flatten
      end

      def as_elastic
        aggs_as_elastic
      end

      def nested name, path
        Arelastic::Aggregations::Nested.new name, path, aggs
      end

      def reverse_nested name, path = nil
        Arelastic::Aggregations::ReverseNested.new name, path, aggs
      end
    end
  end
end
