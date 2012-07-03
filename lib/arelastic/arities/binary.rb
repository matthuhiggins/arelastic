module Arelastic
  module Arities
    module Binary
      def binary(predicate)
        @predicate = predicate
        include Methods

        singleton_class.class_eval do
          attr_reader :predicate
        end

        attr_reader :field, :value
      end

      module Methods
        def initialize field, value
          @field = field
          @value = value
        end

        def as_elastic
          {
            self.class.predicate => {
              field => convert_to_elastic(value)
            }
          }
        end
      end
    end
  end
end