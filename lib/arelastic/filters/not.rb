module Arelastic
  module Filters
    class Not < Arelastic::Filter
      attr_reader :filter

      def initialize filter
        @filter = filter
      end

      def as_elastic
        {"not" => filter.as_elastic}
      end
    end
  end
end