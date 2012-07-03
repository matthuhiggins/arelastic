module Arelastic
  module Searches
    class Query < Arelastic::Searches::Search
      unary 'query', expects: Arelastic::Queries::Query
    end
  end
end