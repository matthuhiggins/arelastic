module Arelastic
  module Filters
    class Prefix < Arelastic::Filters::Filter
      binary 'prefix'
    end
  end
end