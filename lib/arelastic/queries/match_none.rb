module Arelastic
  module Queries
    class MatchNone < Arelastic::Queries::Query
      def as_elastic
        {"match_none" => {}}
      end
    end
  end
end
