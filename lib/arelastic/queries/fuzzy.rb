module Arelastic
  module Queries
    class Fuzzy < Arelastic::Queries::Query
      binary 'fuzzy'
    end
  end
end
