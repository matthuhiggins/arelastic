module Arelastic
  module Builders
    class Mapping < Struct.new :field
      class << self
        def [](field)
          new(field)
        end
      end

      def multi_field(options)
        Arelastic::Mappings::MultiField.new field, options
      end

    end
  end
end