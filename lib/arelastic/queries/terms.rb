module Arelastic
  module Queries
    class Terms < Arelastic::Queries::Query
      binary 'terms'
    end
  end
end