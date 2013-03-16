module Arelastic
  module Mappings
    class MultiField < Arelastic::Mappings::Type
      attr_reader :field, :field_mappings
      def initialize(field, field_mappings)
        @field = field
        @field_mappings = field_mappings
      end

      def as_elastic
        {
          field => {
            'type'    => 'multi_field',
            'fields'  => field_mappings
          }
        }
      end
    end
  end
end