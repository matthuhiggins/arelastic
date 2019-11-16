module Arelastic
  module Builders
    class Aggregations
      class << self
        MACROS_TO_ARELASTIC = {
          date_histogram: Arelastic::Aggregations::DateHistogram,
          filter:         Arelastic::Aggregations::Filter,
          histogram:      Arelastic::Aggregations::Histogram,
          nested:         Arelastic::Aggregations::Nested,
          sample:         Arelastic::Aggregations::Sampler,
          terms:          Arelastic::Aggregations::Terms
        }

        MACROS_TO_ARELASTIC.each do |macro, klass|
          define_method macro do |*args|
            klass.new(*args)
          end
        end
      end
    end
  end
end
