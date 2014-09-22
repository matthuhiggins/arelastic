module Arelastic
  module Aggregations
    class Aggregation < Arelastic::Nodes::Node
      attr_accessor :name, :aggs

      def initialize(name, options)
        @name = name
        @options = options
      end

      def as_elastic
        params = as_elastic_aggregation
        if aggs.any?
          params['aggs'] = convert_to_elastic(aggs)
        end

        {name => params}
      end

      # def nested path
      #   Arelastic::Aggregations::Nested.new path, self
      # end
    end
  end
end
