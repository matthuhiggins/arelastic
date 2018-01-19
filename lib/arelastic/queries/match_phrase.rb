module Arelastic
  module Queries
    class MatchPhrase < Arelastic::Queries::Query
      binary 'match_phrase'
    end
  end
end
