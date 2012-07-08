module Arelastic
  module Builders
    class Query
      class << self
        def constant_score(filter_or_query)
          query Arelastic::Queries::ConstantScore.new(filter_or_query)
        end

        def filtered(query, filter)
          query Arelastic::Queries::Filtered.new(query, filter)
        end

        def match_all
          query Arelastic::Queries::MatchAll.new
        end

        private
          def query value
            Arelastic::Searches::Query.new value
          end
      end
    end
  end
end