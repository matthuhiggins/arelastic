module Arelastic
  module Filters
    class And < Arelastic::Filters::Filter
      polyadic 'and'
    end
  end
end