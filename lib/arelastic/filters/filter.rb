module Arelastic
  module Filters
    class Filter < Arelastic::Queries::Query
      def nested path
        Arelastic::Queries::Nested.new path, Arelastic::Queries::ConstantScore.new(self)
      end
    end
  end
end
