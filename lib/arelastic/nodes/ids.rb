module Arelastic
  module Nodes
    class Ids < Arelastic::Nodes::Node
      attr_reader :values

      def initialize values
        @values = values
      end

      def as_elastic
        { "ids" => { "values" : values }}
      end
    end
  end
end

