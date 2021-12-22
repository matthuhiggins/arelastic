module Arelastic
  module Queries
    class HasParent < Arelastic::Queries::Query
      attr_reader :parent_type, :query

      def initialize parent_type, query
        @parent_type = parent_type
        @query = query
      end

      def as_elastic
        {
          "has_parent" => {
            "parent_type" => parent_type,
            "query"       => convert_to_elastic(query)
          }
        }
      end
    end
  end
end
