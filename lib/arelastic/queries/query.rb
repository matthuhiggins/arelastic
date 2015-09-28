module Arelastic
  module Queries
    class Query < Arelastic::Nodes::Node
      def nested path
        Arelastic::Queries::Nested.new path, self
      end
    end
  end
end