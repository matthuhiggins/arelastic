module Arelastic
  module Queries
    class Range < Arelastic::Queries::Query
      binary 'range'
    end
  end
end