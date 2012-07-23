module Arelastic
  module Queries
    class Filtered < Arelastic::Queries::Query
      attr_accessor :query, :filter
      def initialize(query, filter)
        @query = query
        @filter = filter
      end

      def as_elastic
        { "filtered" => Arelastic::Nodes::HashGroup.new([query, filter]).as_elastic }
      end
    end
  end
end