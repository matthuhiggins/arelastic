module Arelastic
  module Aggregations
    class Nested < Arelastic::Aggregations::SpecialSingleBucket
      def specification_key
        'path'
      end
    end
  end
end
