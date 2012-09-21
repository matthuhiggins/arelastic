module Arelastic
  module Filters
    class MatchAll < Arelastic::Filters::Filter
      def as_elastic
        {"match_all" => {}}
      end
    end
  end
end
