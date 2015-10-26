module Arelastic
  module Queries
    class SimpleQueryString < Query
      attr_accessor :fields, :query, :options
      def initialize(fields, query, options = {})
        @fields = fields
        @query = query
        @options = options
      end

      def as_elastic
        {
          "simple_query_string" => {
            "fields"  => convert_to_elastic(fields),
            "query"   => convert_to_elastic(query)
          }.merge(options)
        }
      end
    end
  end
end
