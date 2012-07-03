module Arelastic
  module Queries
    class Filtered < Arelastic::Query
      attr_accessor :query, :filter
      def initialize(query, filter)
        @query = query
        @filter = filter
      end

      def to_elastic
        {
          "filtered" => {
            "query"   => query.to_elastic,
            "filter"  => query.to_elastic
          }
        }
      end
    end
  end
end