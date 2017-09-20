module Arelastic
  module Queries
    class Bool < Arelastic::Queries::Query
      attr_accessor :must, :filter, :should, :must_not, :options
      def initialize(options)
        @must     = read_option! options, 'must'
        @filter   = read_option! options, 'filter'
        @should   = read_option! options, 'should'
        @must_not = read_option! options, 'must_not'
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

        { 'bool' => searches.update(options) }
      end
    end
  end
end
