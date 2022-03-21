module Arelastic
  module Aggregations
    class Parent < Arelastic::Aggregations::SpecialSingleBucket
      def specification_key
        'type'
      end
    end
  end
end
