module Arelastic
  module Aggregations
    class Children < Arelastic::Aggregations::SpecialSingleBucket
      def specification_key
        'type'
      end
    end
  end
end
