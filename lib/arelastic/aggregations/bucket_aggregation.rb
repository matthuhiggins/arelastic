module Arelastic
  module Aggregations
    class BucketAggregation < Arelastic::Aggregations::Aggregation
      attr_accessor :aggs

      def initialize(name, options = {}, aggs: [])
        super name, options
        @aggs = aggs
      end

      def base_bucket_aggregation
        if aggs.any?
          { 'aggs' => sub_aggs }
        else
          {}
        end
      end

      private

        def sub_aggs
          @sub_aggs ||=
            begin
              aggs.each_with_object({}) do |agg, result|
                result.merge!(agg.as_elastic)
              end
            end
        end
    end
  end
end
