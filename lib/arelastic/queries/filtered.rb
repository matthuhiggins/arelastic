module Arelastic
  module Queries
    class Filtered < Arelastic::Queries::Query
      attr_accessor :query, :filter
      def initialize(query: nil, filter: nil)
        @query = query
        @filter = filter
      end

      def as_elastic
        searches = {}
        searches['query']  = convert_to_elastic(query)  if query
        searches['filter'] = convert_to_elastic(filter) if filter

        { "filtered" => searches }
      end
    end
  end
end
