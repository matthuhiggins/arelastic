module Arelastic
  module Aggregations
    class BucketSelector < Arelastic::Aggregations::Aggregation
      attr_accessor :script_params, :script

      def initialize(name, options = {})
        options = options.dup
        @script_params = read_option! options, 'script_params'
        @script = read_option! options, 'script'
        super(name, options)
      end

      def as_elastic_aggregation
        {
          'bucket_selector' => {
            'buckets_path' => script_params,
            'script' => script
          }
        }
      end
    end
  end
end
