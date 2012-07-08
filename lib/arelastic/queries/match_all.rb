module Arelastic
  module Queries
    class MatchAll
      def as_elastic
        {"match_all" => {}}
      end
    end
  end
end
