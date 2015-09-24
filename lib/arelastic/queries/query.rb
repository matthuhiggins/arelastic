module Arelastic
  module Queries
    class Query < Arelastic::Nodes::Node
      def nested path
        Arelastic::Queries::Nested.new path, "query" => self.as_elastic
      end
    end
  end
end