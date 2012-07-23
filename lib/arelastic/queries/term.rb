module Arelastic
  module Queries
    class Term < Arelastic::Queries::Query
      binary 'term'
    end
  end
end