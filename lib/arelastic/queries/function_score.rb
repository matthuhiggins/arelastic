module Arelastic
  module Queries
    class FunctionScore < Arelastic::Queries::Query
      attr_accessor :query, :functions, :options
      def initialize(options)
        @query     = read_option! options, 'query'
        @functions = read_option! options, 'functions'
        @options   = options
      end

      def as_elastic
        {
          'function_score' => {
            'query'     => convert_to_elastic(query),
            'functions' => convert_to_elastic(functions)
          }.update(options)
        }
      end
    end
  end
end
