module Arelastic
  module Filters
    class Terms < Arelastic::Filter
      binary 'terms'
    end
  end
end