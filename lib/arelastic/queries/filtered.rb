module Arelastic
  module Queries
    class Filtered < Arelastic::Queries::Query
      attr_accessor :query, :filter
      def initialize(query, filter)
        @query = query
        @filter = filter
      end

      def as_elastic
        {
          "filtered" => {
            "query"   => convert_to_elastic(query),
            "filter"  => convert_to_elastic(filter)
          }
        }
      end
    end
  end
end