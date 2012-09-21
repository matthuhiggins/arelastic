module Arelastic
  module Filters
    class MatchAll
      def as_elastic
        {"match_all" => {}}
      end
    end
  end
end
