module Arelastic
  module Filters
    class Terms < Arelastic::Filters::Filter
      binary 'terms'
    end
  end
end