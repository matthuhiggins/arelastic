module Arelastic
  module Queries
    class Nested < Arelastic::Queries::Query
      include Arelastic::Nodes::Nested
    end
  end
end