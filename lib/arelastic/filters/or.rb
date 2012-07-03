module Arelastic
  module Filters
    class Or < Arelastic::Filters::Filter
      polyadic 'or'
    end
  end
end