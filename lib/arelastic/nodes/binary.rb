module Arelastic
  module Nodes
    class Binary < Arelastic::Nodes::Node
      # predicates = prefix, term, terms
      attr_reader :field, :predicate, :value

      def initialize field, predicate, value
        @field = field
        @predicate = predicate
        @value = value
      end
    end
  end
end