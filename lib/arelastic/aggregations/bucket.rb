module Arelastic
  module Aggregations
    class Bucket < Arelastic::Aggregations::Aggregation
      attr_accessor :aggs

      def initialize(name, options = {})
        super(name, options)
        @aggs = options[:aggs] || options['aggs']
      end

      def as_elastic
        {name => as_elastic_aggregation.merge(sub_aggregations_as_elastic)}
      end

      def sub_aggregations_as_elastic
        if aggs
          {'aggs' => Arelastic::Nodes::HashGroup.new(aggs).as_elastic}
        else
          {}
        end
      end
    end
  end
end