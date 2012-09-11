module Arelastic
  module Queries
    class Match < Arelastic::Queries::Query
      binary 'match'
    end
  end
end