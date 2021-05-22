module Arelastic
  module Aggregations
    class BucketSort < Arelastic::Aggregations::Aggregation
      attr_accessor :from, :size, :sort

      def initialize(name, options = {})
        options = options.dup
        @from = read_option! options, 'from'
        @size = read_option! options, 'size'
        @sort = read_option! options, 'sort'
        super(name, options)
      end

      def as_elastic_aggregation
        bucket_sort = {}
        bucket_sort['sort'] = parse_sort if sort
        bucket_sort['from'] = from if from
        bucket_sort['size'] = size if size
        { 'bucket_sort' => bucket_sort }
      end

      private

        def parse_sort
          if sort.is_a?(Hash)
            sort.map { |bucket_path, order| { bucket_path => order } }
          elsif sort.is_a?(String)
            [sort]
          elsif sort.is_a?(Array)
            sort
          else
            raise TypeError.new('Expecting a hash, string, or array as the "sort" argument')
          end
        end
    end
  end
end
