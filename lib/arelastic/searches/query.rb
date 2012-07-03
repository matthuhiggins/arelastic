module Arelastic
  module Searches
    class Query < Arelastic::Search
      unary 'query', expects: Arelastic::Query
    end
  end
end