module Arelastic
  module Aggregations
    class Filters < Arelastic::Aggregations::Bucket
      attr_accessor :filters

      def initialize(name, filters, options = {})
        super name, options
        @filters = filters
      end

      def as_elastic_aggregation
        {'filters' => {'filters' => convert_to_elastic(filters)}}.merge(super)
      end
    end
  end
end
