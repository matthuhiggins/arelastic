module Arelastic
  module Queries
    class MultiMatch < Query
      attr_accessor :query, :fields, :options
      def initialize(query, fields, options = {})
        @query = query
        @fields = fields
        @options = options
      end

      def as_elastic
        {
          "multi_match" => {
            "query"   => convert_to_elastic(query),
            "fields"  => convert_to_elastic(fields)
          }.merge(options)
        }
      end
    end
  end
end
