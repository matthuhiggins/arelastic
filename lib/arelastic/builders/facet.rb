module Arelastic
  module Builders
    class Facet < Struct.new :name
      def terms(field, options = {})
        Arelastic::Facets::Terms.new(name, field, options)
      end

      def range
        
      end
    end
  end
end