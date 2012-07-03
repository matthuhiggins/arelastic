module Arelastic
  module Filters
    class Term < Arelastic::Filter
      binary 'term'
    end
  end
end