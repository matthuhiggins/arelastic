module Arelastic
  module Queries
    class QueryString < Arelastic::Queries::Query
      attr_accessor :query_string
      attr_accessor :options

      def initialize(query_string, options = {})
        @query_string = query_string
        @options = options
      end

      def as_elastic
        {"query_string" => {"query" => query_string}}
      end
    end
  end
end