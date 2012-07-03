module Arelastic
  module Filters
    class Prefix < Arelastic::Filter
      binary 'prefix'
    end
  end
end