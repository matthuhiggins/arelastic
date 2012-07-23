module Arelastic
  module Builders
    class Facet < Struct.new :name
      class << self
        def [](name)
          new(name)
        end
      end

      def terms field, options = {}
        Arelastic::Facets::Terms.new name, field, options
      end

      def histogram options
        Arelastic::Facets::Histogram.new name, options
      end
    end
  end
end