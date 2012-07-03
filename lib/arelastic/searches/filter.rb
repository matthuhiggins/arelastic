module Arelastic
  module Searches
    class Filter < Arelastic::Search
      unary 'filter', expects: Arelastic::Filter
    end
  end
end