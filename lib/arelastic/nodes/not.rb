module Arelastic
  module Nodes
    class Not < Arelastic::Nodes::Node
      attr_reader :filter

      def initialize filter
        @filter = filter
      end

      def as_elastic
        {"not" => filter.as_elastic}
      end
    end
  end
end