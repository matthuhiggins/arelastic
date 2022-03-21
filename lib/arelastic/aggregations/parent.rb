module Arelastic
  module Aggregations
    class Parent < Arelastic::Aggregations::SpecialSingleBucket
      def aggregation_name
        'parent'
      end

      def specification_key
        'type'
      end
    end
  end
end
