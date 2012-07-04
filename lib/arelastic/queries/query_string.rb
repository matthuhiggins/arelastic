module Arelastic
  module Queries
    class QueryString < Arelastic::Queries::Query
      unary 'query_string'
    end
  end
end