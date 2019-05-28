module Arelastic
  module Queries
    class Nested < Arelastic::Queries::Query
      attr_accessor :path, :query, :options

      def initialize(path, query, options = {})
        @path    = path
        @query   = query
        @options = options
      end

      def as_elastic
        params = {
          'path'   => path,
          'query'  => convert_to_elastic(query)
        }.update(options)

        { 'nested' => params }
      end
    end
  end
end
