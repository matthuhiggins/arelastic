module Arelastic
  module Queries
    class Prefix < Arelastic::Query
      binary 'prefix'
    end
  end
end