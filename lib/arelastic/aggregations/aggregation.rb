module Arelastic
  module Aggregations
    class Aggregation < Arelastic::Nodes::Node
      attr_accessor :name, :meta, :options

      def initialize(name, options = {})
        @name    = name

        options  = options.dup
        @meta    = read_option! options, 'meta'
        @options = options
      end

      def as_elastic
        params = as_elastic_aggregation
        params['meta'] = meta if meta
        {name => params}
      end

      def nested(path)
        Arelastic::Aggregations::Nested.new(name, path, [self])
      end

      def reverse_nested(path = nil)
        Arelastic::Aggregations::ReverseNested.new(name, path, [self])
      end
    end
  end
end
