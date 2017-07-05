module Arelastic
  module Queries
    class Bool < Arelastic::Queries::Query
      attr_accessor :must, :filter, :should, :must_not
      def initialize(must: nil, filter: nil, should: nil, must_not: nil)
        @must     = must
        @filter   = filter
        @should   = should
        @must_not = must_not
      end

      def as_elastic
        searches = {}

        {
          'must'     => must,
          'filter'   => filter,
          'should'   => should,
          'must_not' => must_not
        }.each do |k, v|
          searches[k] = convert_to_elastic(v) if v
        end

        {'bool' => searches}
      end
    end
  end
end
