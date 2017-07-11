module Arelastic
  module Queries
    class HasChild < Arelastic::Queries::Query
      attr_reader :type, :query

      def initialize type, query
        @type = type
        @query = query
      end

      def as_elastic
        {
          "has_child" => {
            "type"  => type,
            "query" => convert_to_elastic(query)
          }
        }
      end
    end
  end
end