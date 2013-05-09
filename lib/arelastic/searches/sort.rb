module Arelastic
  module Searches
    class Sort < Arelastic::Searches::Search
      attr_reader :sorts
      def initialize sorts
        @sorts = sorts
      end

      def as_elastic
        {'sort' => sorts.map { |sort| convert_to_elastic(sort) }}
      end
    end
  end
end