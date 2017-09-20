module Arelastic
  module Queries
    class DisMax < Arelastic::Queries::Query
      attr_accessor :queries, :options
      def initialize(queries, options = {})
        @queries = queries
        @options = options
      end

      def as_elastic
        {
          'dis_max' => {
            'queries' => convert_to_elastic(queries),
          }.merge(options)
        }
      end
    end
  end
end

