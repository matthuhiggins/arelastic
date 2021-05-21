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

      def parse_sort
        if sort.is_a?(Array)
          sort.map { |item| Arelastic::Sorts::Field.new(item).as_elastic }
        elsif sort.is_a?(Hash)
          sort.map do |bucket_path, order|
            Arelastic::Sorts::Field.new({ bucket_path => order }).as_elastic
          end
        elsif sort.is_a?(String)
          Arelastic::Sorts::Field.new(sort).as_elastic
        end
      end
    end
  end
end
