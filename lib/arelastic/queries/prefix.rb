module Arelastic
  module Queries
    class Prefix < Arelastic::Queries::Query
      binary 'prefix'
    end
  end
end