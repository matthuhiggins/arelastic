module Arelastic
  module Queries
    class Bool < Arelastic::Queries::Query
      attr_accessor :must, :filter, :should, :must_not, :options
      def initialize(must: nil, filter: nil, should: nil, must_not: nil, **options)
        @must     = must
        @filter   = filter
        @should   = should
        @must_not = must_not
        @options  = options
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

        opts = stringify_options(options)

        { 'bool' => searches.update(opts) }
      end
    end
  end
end
