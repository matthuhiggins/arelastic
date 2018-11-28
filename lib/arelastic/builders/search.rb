require 'arelastic/builders/query_builder'

module Arelastic
  module Builders
    class Search
      include Arelastic::Builders::QueryBuilder

      class << self
        def filter
          Arelastic::Builders::Filter
        end

        def [](field)
          filter[field]
        end

        def aggregation
          Arelastic::Builders::Aggregation
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
end
