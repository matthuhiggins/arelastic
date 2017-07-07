module Arelastic
  module Aggregations
    class ReverseNested < Arelastic::Aggregations::Aggregation
      include Arelastic::Nodes::HasAggregations

      attr_accessor :path

      def initialize(name, path = nil, aggs)
        super name
        @path = path
        @aggs = aggs
      end

      def as_elastic_aggregation
        aggs_as_elastic.merge!({ "reverse_nested" => options })
      end

      def options
        if path
          { "path" => path }
        else
          {}
        end
      end
    end
  end
end
