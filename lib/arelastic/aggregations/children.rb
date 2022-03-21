module Arelastic
  module Aggregations
    class Children < Arelastic::Aggregations::SpecialSingleBucket
      def aggregation_name
        'children'
      end

      def specification_key
        'type'
      end
    end
  end
end
