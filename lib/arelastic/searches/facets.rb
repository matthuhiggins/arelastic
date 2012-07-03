module Arelastic
  module Searches
    class Facets < Arelastic::Search
      unary 'facets' # not sure if this is oversimplified
    end
  end
end