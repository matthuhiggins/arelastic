module Arelastic
  module Arities
    module Binary
      def binary(predicate)
        @predicate = predicate
        include Methods

        singleton_class.class_eval do
          attr_reader :predicate
        end

        attr_reader :field, :value, :options
      end

      module Methods
        def initialize field, value, options = {}
          @field = field
          @value = value
          @options = options
        end

        def as_elastic
          params = {field => convert_to_elastic(value)}.update(options)

          { self.class.predicate => params }
        end
      end
    end
  end
end
