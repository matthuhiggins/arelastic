module Arelastic
  module Aggregations
    class Sampler < Bucket
      attr_accessor :shard_size
      def initialize(name, shard_size, aggs)
        super(name, aggs: aggs)
        @shard_size = shard_size
      end

      def as_elastic_aggregation
        {'sampler' => { 'shard_size' => shard_size}}.merge(super)
      end
    end
  end
end
