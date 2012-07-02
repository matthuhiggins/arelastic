module Arelastic
  module Filters
    class Or < Arelastic::Filter
      attr_reader :children

      def initialize children
        @children = children
      end

      def as_elastic
        children.map { |child| child.as_elastic }
      end
    end
  end
end