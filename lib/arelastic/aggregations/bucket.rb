module Arelastic
  module Aggregations
    class Bucket < Arelastic::Aggregations::Aggregation
      attr_accessor :aggs

      def initialize(name, options = {})
        options = options.dup
        @aggs = read_option! options, 'aggs'
        super(name, options)
      end

      def as_elastic_aggregation
        if aggs
          {'aggs' => Arelastic::Nodes::HashGroup.new(aggs).as_elastic}
        else
          {}
        end
      end
    end
  end
end
