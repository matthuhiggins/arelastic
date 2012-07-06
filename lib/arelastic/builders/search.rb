module Arelastic
  module Builders
    class Search
      def filter(field)
        Arelastic::Builders::Filter.new(field.to_s)
      end

      alias :[] :filter

      def facet(name)
        Arelastic::Builders::Facet.new(name.to_s)
      end

      def query
        @query_builder ||= Arelastic::Builders::Query.new
      end
    end
  end
end