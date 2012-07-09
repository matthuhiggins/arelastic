module Arelastic
  module Builders
    class Search
      def filter
        Arelastic::Builders::Filter
      end

      def [](field)
        filter[field]
      end

      def facet
        Arelastic::Builders::Facet
      end

      def query
        Arelastic::Builders::Query
      end

      def sort
        Arelastic::Builders::Sort
      end
    end
  end
end