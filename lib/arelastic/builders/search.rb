module Arelastic
  module Builders
    class Search
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

        def queries
          Arelastic::Builders::Queries
        end

        def sort
          Arelastic::Builders::Sort
        end
      end
    end
  end
end
