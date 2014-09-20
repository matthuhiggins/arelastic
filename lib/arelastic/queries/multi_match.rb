module Arelastic
  module Queries
    class MultiMatch < Query
      attr_accessor :query, :fields, :options
      def initialize(fields, query, options = {})
        @query = query
        @fields = fields
        @options = options
      end

      def as_elastic
        {
          "multi_match" => {
            "fields"  => convert_to_elastic(fields),
            "query"   => convert_to_elastic(query)
          }.merge(options)
        }
      end
    end
  end
end
