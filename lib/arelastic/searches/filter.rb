module Arelastic
  module Searches
    class Filter < Arelastic::Searches::Search
      unary 'filter', expects: Arelastic::Filters::Filter
    end
  end
end