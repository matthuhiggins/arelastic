module Arelastic
  module Aggregations
    class Nested < Arelastic::Aggregations::SpecialSingleBucket
      def aggregation_name
        'nested'
      end

      def specification_key
        'path'
      end
    end
  end
end
