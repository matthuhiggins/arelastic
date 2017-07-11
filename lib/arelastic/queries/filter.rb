module Arelastic
  module Queries
    class Filter < Arelastic::Queries::Query
      def nested path
        Arelastic::Queries::Nested.new path, self
      end
    end
  end
end
