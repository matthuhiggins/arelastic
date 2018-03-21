module Arelastic
  module Builders
    class Aggregation < Struct.new :name
      class << self
        def [](name)
          new(name)
        end
      end

      def histogram options
        Arelastic::Aggregations::Histogram.new name, options
      end

      def sample shard_size, aggs
        Arelastic::Aggregations::Sampler.new(name, sample_size, aggs)
      end

      def terms options = {}
        Arelastic::Aggregations::Terms.new(name, options)
      end
    end
  end
end
