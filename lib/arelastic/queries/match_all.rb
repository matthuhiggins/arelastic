module Arelastic
  module Queries
    class MatchAll < Arelastic::Queries::Query
      def as_elastic
        {"match_all" => {}}
      end
    end
  end
end
