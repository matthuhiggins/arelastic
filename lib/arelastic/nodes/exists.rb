module Arelastic
  module Nodes
    class Exists < Arelastic::Nodes::Node
      attr_reader :field

      def initialize field
        @field = field
      end

      def as_elastic
        {"exists" => { "field" : field }}
      end
    end
  end
end