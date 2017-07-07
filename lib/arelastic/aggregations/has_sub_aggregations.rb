module Arelastic
  module Aggregations
    module HasSubAggregations
      class_eval do
        attr_accessor :aggs
      end

      def sub_aggregations
        if aggs.any?
          { 'aggs' => build_sub_aggs }
        else
          {}
        end
      end

      private

        def build_sub_aggs
          aggs.each_with_object({}) do |agg, result|
            result.merge!(agg.as_elastic)
          end
        end
    end
  end
end
