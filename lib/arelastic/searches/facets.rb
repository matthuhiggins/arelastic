module Arelastic
  module Searches
    class Facets < Arelastic::Searches::Search
      attr_accessor :grouping
      def initialize facets
        @grouping = Arelastic::Nodes::HashGroup.new facets
      end

      def as_elastic
        { "facets" => convert_to_elastic(grouping) }
      end
    end
  end
end