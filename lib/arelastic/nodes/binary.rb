module Arelastic
  module Nodes
    class Binary < Arelastic::Nodes::Node
      # predicates = numeric_range, prefix, range, term, terms
      attr_reader :field, :predicate, :value

      def initialize field, predicate, value
        @field = field
        @predicate = predicate
        @value = value
      end

      def as_elastic
        {
          predicate => {
            field => value.as_elastic
          }
        }
      end
    end
  end
end