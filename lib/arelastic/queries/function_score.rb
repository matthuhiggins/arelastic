module Arelastic
  module Queries
    class FunctionScore < Arelastic::Queries::Query
      attr_accessor :query, :functions, :options
      def initialize(options)
        @query     = options.delete('query') || options.delete(:query)
        @functions = options.delete('functions') || options.delete(:functions)
        @options   = options
      end

      def as_elastic
        searches = {}

        {
          'query'     => query,
          'functions' => functions
        }.each do |k, v|
          searches[k] = convert_to_elastic(v) if v
        end

        { 'function_score' => searches.update(options) }
      end
    end
  end
end
