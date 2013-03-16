module Arelastic
  module Mappings
    class Type < Arelastic::Nodes::Node
      class << self
        attr_reader :type
        def for_type(type)
          @type = type
        end
      end

      attr_reader :field, :options
      def initialize(field, options = {})
        @field = field
        @options = options
      end

      def as_elastic
        params = {'type' => self.class.type}.update(options)

        { field => params }
      end
    end
  end
end