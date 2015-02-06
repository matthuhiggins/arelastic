module Arelastic
  module Aggregations
    class Min < Arelastic::Aggs::Aggregation
      attr_accessor :options

      def initialize name, options
        super name
        @options = options
      end

      def as_elastic_aggregation
        # {"min" => options}
      end
    end
  end
end
