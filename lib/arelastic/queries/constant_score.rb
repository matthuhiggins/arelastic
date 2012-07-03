module Arelastic
  module Queries
    class ConstantScore < Arelastic::Query
      unary 'constant_score'
    end
  end
end