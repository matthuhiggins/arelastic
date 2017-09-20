module Arelastic
  module Queries
    class Filter < Arelastic::Queries::Query
      attr_accessor :query, :options
      def initialize(query, options = {})
        @query = query
        @options = options
      end

      def as_elastic
        params = convert_to_elastic(query)
        { 'filter' => params }.update(options)
      end
    end
  end
end
