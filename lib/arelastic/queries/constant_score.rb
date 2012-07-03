module Arelastic
  module Queries
    class ConstantScore < Arelastic::Query
      attr_accessor :query_or_filter
      def initialize(query_or_filter)
        @query_or_filter = query_or_filter
      end

      def to_elastic
        {
          "constant_score" => query_or_filter.to_elastic
        }
      end
    end
  end
end