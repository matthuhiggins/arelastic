module Arelastic
  module Filters
    class Term < Arelastic::Filters::Filter
      binary 'term'
    end
  end
end