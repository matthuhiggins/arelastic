module Arelastic
  module Builders
    class Query
      def filtered(query, filter)
        Arelastic::Searches::Query.new(Arelastic::Queries::Filtered.new(query, filter))
      end

      def constant_score(filter_or_query)
        Arelastic::Searches::Query.new(Arelastic::Queries::ConstantScore.new(filter_or_query))
      end
    end
  end
end