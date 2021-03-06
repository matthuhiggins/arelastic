module Arelastic
  module Queries
    class MultiMatch < Query
      attr_accessor :fields, :query, :options
      def initialize(fields, query, options = {})
        @fields = fields
        @query = query
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
