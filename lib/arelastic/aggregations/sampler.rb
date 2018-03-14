module Arelastic
  module Aggregations
    class Sampler < Bucket
      def initialize(name, shard_size, aggs)
        super(name, aggs: aggs, shard_size: shard_size)
      end

      def as_elastic_aggregation
        { 'sampler' => { 'shard_size' => options[:shard_size] } }
      end
    end
  end
end
