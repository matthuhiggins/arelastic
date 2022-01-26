module Arelastic
  module Queries
    class Query < Arelastic::Nodes::Node
      def nested path
        Arelastic::Queries::Nested.new path, self
      end

      def has_child path
        Arelastic::Queries::HasChild.new path, self
      end

      def has_parent path
        Arelastic::Queries::HasParent.new path, self
      end

      def negate
        Arelastic::Queries::Bool.new must_not: self
      end
    end
  end
end
