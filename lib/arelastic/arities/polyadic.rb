module Arelastic
  module Arities
    module Polyadic
      def polyadic(operator)
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
          {self.class.operator => convert_to_elastic(children)}
        end
      end
    end
  end
end
