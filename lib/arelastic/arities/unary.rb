module Arelastic
  module Arities
    module Unary
      def unary(field, options = {})
        @field = field
        include Methods

        singleton_class.class_eval do
          attr_reader :field
        end

        attr_reader :expr
      end

      module Methods
        def initialize expr
          # raise "#{expr.inspect} must be an Arelastic::Filters::Filter" unless expr.is_a?(Arelastic::Filters::Filter)
          @expr = expr
        end

        def as_elastic
          {self.class.field => expr}
        end
      end
    end
  end
end