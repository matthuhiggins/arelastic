module Arelastic
  module Searches
    class Aggregations < Arelastic::Searches::Search
      def initialize *aggs
        @aggs = aggs.flatten
      end

      def as_elastic
        aggs_as_elastic
      end
    end
  end
end
