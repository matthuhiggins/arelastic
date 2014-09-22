module Arelastic
  module Searches
    class Aggregations < Arelastic::Searches::Search
      attr_accessor :grouping
      def initialize aggregations
        @grouping = Arelastic::Nodes::HashGroup.new aggregations
      end

      def as_elastic
        { "aggs" => convert_to_elastic(grouping) }
      end
    end
  end
end
