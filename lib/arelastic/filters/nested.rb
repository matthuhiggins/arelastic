module Arelastic
  module Filters
    class Nested < Arelastic::Filters::Filter
      include Arelastic::Nodes::Nested
    end
  end
end