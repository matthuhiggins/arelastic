module Arelastic
  class Node
    include Arelastic::Arity::Binary
    include Arelastic::Arity::Polyadic
    include Arelastic::Arity::Unary
  end
end