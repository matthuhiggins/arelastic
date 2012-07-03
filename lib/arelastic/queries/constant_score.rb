module Arelastic
  module Queries
    class ConstantScore < Arelastic::Queries::Query
      unary 'constant_score'
    end
  end
end