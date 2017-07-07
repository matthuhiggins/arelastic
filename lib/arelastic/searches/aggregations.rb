module Arelastic
  module Searches
    class Aggregations < Arelastic::Searches::Search
      include Arelastic::Aggregations::HasSubAggregations

      def initialize *aggs
        @aggs = aggs.flatten
      end

      def as_elastic
        sub_aggregations
      end

      def nested(name, path)
        Arelastic::Aggregations::Nested.new name, path, aggs
      end

      def reverse_nested(name, path = nil)
        Arelastic::Aggregations::ReverseNested.new name, path, aggs
      end
    end
  end
end
