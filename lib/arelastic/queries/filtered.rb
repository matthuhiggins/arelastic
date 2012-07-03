module Arelastic
  module Queries
    class Filtered < Arelastic::Queries::Query
      attr_accessor :grouping
      def initialize(query, filter)
        @grouping = Arelastic::Nodes::Grouping.new [query, filter]
      end

      def to_elastic
        { "filtered" => convert_to_elastic(grouping) }
      end
    end
  end
end