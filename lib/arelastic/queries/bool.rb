module Arelastic
  module Queries
    class Bool < Arelastic::Queries::Query
      attr_accessor :must, :filter, :should, :must_not, :options
      def initialize(must: nil, filter: nil, should: nil, must_not: nil, **options)
        @must     = must
        @filter   = filter
        @should   = should
        @must_not = must_not
        @options  = options.each_with_object({}) { |(k, v), memo| memo[k.to_s] = v }
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

        { 'bool' => searches.merge(options) }
      end
    end
  end
end
