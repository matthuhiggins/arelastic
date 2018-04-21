module Arelastic
  module Aggregations
    class Filter < Arelastic::Aggregations::Bucket
      attr_accessor :filter

      def initialize(name, filter, options = {})
        super name, options
        @filter = filter
      end

      def as_elastic_aggregation
        {'filter' => convert_to_elastic(filter)}.merge(super)
      end
    end
  end
end
