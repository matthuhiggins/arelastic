module Arelastic
  module Queries
    class MatchAll < Arelastic::Queries::Query
      def as_elastic
        {"match_all" => {}}
      end

      def hash
        0
      end

      def eql?(other)
        other.is_a?(self.class)
      end
    end
  end
end
