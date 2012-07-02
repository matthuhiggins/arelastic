module Arelastic
  module Nodes
    class Limit < Arelastic::Nodes::Node
      attr_reader :value

      def initialize value
        @value = value
      end

      def as_elastic
        {"limit" => {"value" => value}}
      end
    end
  end
end