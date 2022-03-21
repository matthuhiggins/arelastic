module Arelastic
  module Aggregations
    class SpecialSingleBucket < Arelastic::Aggregations::Bucket
      attr_accessor :specification

      def initialize(name, specification, aggs)
        super name, aggs: aggs
        @specification = specification
      end

      def as_elastic_aggregation
        { aggregation_name => { specification_key => specification } }.merge(super)
      end
    end
  end
end
