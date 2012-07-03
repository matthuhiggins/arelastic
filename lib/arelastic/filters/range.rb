module Arelastic
  module Filters
    class Range < Arelastic::Filters::Filter
      binary 'range'
    end
  end
end