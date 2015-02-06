module Arelastic
  module Aggregations
    class Aggregation < Arelastic::Nodes::Node
      attr_accessor :name, :options

      def initialize(name, options = {})
        @name = name
        @options = options
      end

      def as_elastic
        {name => as_elastic_aggregation}
      end

      def as_elastic_aggregation
        raise 'not implemented'
      end
    end
  end
end
