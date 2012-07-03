module Arelastic
  module Arity
    module Polyadic
      def unary(operator)
        @operator = operator
        include Methods

        singleton_class.class_eval do
          attr_reader :operator
        end

        attr_reader :children
      end

      module Methods
        def initialize children
          @children = children
        end

        def as_elastic
          {self.class.operator => children.map { |child| convert_to_elastic(child) }}
        end
      end
    end
  end
end
