module Arelastic
  module Searches
    class Aggregations < Arelastic::Searches::Search
      attr_accessor :aggs

      def initialize *aggs
        @aggs = aggs.flatten
      end

      def as_elastic
        grouping = Arelastic::Nodes::HashGroup.new(aggs)
        { "aggs" => grouping.as_elastic }
      end
    end
  end
end
