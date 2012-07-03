module Arelastic
  class Node
    include Arelastic::Arity::Binary
    include Arelastic::Arity::Polyadic
    include Arelastic::Arity::Unary

    def convert_to_elastic(val)
      val.respond_to?(:to_elastic) ? val.to_elastic : val
    end
  end
end