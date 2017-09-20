module Arelastic
  module Queries
    class Bool < Arelastic::Queries::Query
      attr_accessor :must, :filter, :should, :must_not, :options
      def initialize(options)
        @must     = options.delete('must') || options.delete(:must)
        @filter   = options.delete('filter') || options.delete(:filter)
        @should   = options.delete('should') || options.delete(:should)
        @must_not = options.delete('must_not') || options.delete(:must_not)
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
