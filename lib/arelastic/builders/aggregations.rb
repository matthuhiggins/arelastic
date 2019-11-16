module Arelastic
  module Builders
    class Aggregations
      class << self
        MACROS_TO_ARELASTIC = {
          cardinnality:   Arelastic::Aggregations::Cardinality,
          date_histogram: Arelastic::Aggregations::DateHistogram,
          filter:         Arelastic::Aggregations::Filter,
          filters:        Arelastic::Aggregations::Filters,
          histogram:      Arelastic::Aggregations::Histogram,
          missing:        Arelastic::Aggregations::Missing,
          nested:         Arelastic::Aggregations::Nested,
          range:          Arelastic::Aggregations::Range,
          reverse_nested: Arelastic::Aggregations::ReverseNested,
          sampler:        Arelastic::Aggregations::Sampler,
          terms:          Arelastic::Aggregations::Terms,
          value_count:    Arelastic::Aggregations::ValueCount
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
