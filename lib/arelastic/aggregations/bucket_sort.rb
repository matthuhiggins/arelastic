module Arelastic
  module Aggregations
    class BucketSort < Arelastic::Aggregations::Aggregation
      attr_accessor :sort

      def initialize(name, options = {})
        super
        @sort = read_option! options, 'sort'
      end

      def as_elastic_aggregation
        params = options
        params = params.merge('sort' => convert_to_elastic(sort)) if sort
        { 'bucket_sort' => params }
      end
    end
  end
end
