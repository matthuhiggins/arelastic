module Arelastic
  module Aggregations
    class ReverseNested < Arelastic::Aggregations::Aggregation
      include HasSubAggregations

      attr_accessor :path

      def initialize(name, path = nil, aggs)
        super name
        @path = path
        @aggs = aggs
      end

      def as_elastic_aggregation
        sub_aggregations.merge!({ "reverse_nested" => options })
      end

      def options
        if path.presence
          { "path" => path }
        else
          {}
        end
      end
    end
  end
end
