module Arelastic
  module Queries
    class FunctionScore < Arelastic::Queries::Query
      attr_accessor :query, :functions, :options
      def initialize(query: nil, functions: nil, **options)
        @query = query
        @functions = functions
        @options  = options
      end

      def as_elastic
        searches = {}

        {
          'query'     => query,
          'functions' => functions
        }.each do |k, v|
          searches[k] = convert_to_elastic(v) if v
        end

        opts = stringify_options(options)

        { 'function_score' => searches.update(opts) }
      end
    end
  end
end
