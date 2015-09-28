module Arelastic
  module Filters
    class Filter < Arelastic::Nodes::Node
      def or other
        Arelastic::Filters::Or.new [self, other]
      end

      def and other
        Arelastic::Filters::And.new [self, other]
      end

      def negate
        Arelastic::Filters::Not.new self
      end

      def nested path
        Arelastic::Filters::Nested.new path, self
      end
    end
  end
end
