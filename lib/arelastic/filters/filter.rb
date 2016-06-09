module Arelastic
  module Filters
    class Filter < Arelastic::Queries::Query
      def or other
        Arelastic::Filters::Or.new [self, other]
      end

      def and other
        Arelastic::Filters::And.new [self, other]
      end

      def nested path
        Arelastic::Filters::Nested.new path, self
      end
    end
  end
end
