module Arelastic
  class Scope
    attr_accessor :query_value,
                  :filter_values,
                  :limit_value,
                  :offset_value,
                  :facet_values,
                  :sort_values

    def initialize
      @filter_values = []
      @query_values = []
      @limit_value = nil
      @offset_value = nil
      @facet_values = []
      @sort_values = []
    end

    def search
      @search ||= Arelastic::Builders::Search.new
    end

    def query!(value)
      self.query_value = value
      self
    end

    def query(value)
      clone.query! value
    end

    def filter!(*args)
      self.filter_values += args.flatten
      self
    end

    def filter(*args)
      clone.filter!(*args)
    end

    def limit!(value)
      self.limit_value = value
      self
    end

    def limit(value)
      clone.limit!(value)
    end

    def offset!(value)
      self.offset_value = value
      self
    end

    def offset(value)
      clone.offset! value
    end

    def facet!(*args)
      self.facet_values += args.flatten
      self
    end

    def facet(*args)
      clone.facet! *args
    end

    def sort!(*args)
      self.sort_values += args.flatten
    end

    def sort(*args)
      clone.sort! *args
    end

    def as_elastic
      build_search.as_elastic
    end

    private
      def build_search
        searches = [
          build_query_and_filter(query_value, filter_values),
          build_limit(limit_value),
          build_offset(offset_value),
          build_facets(facet_values),
          build_sorts(sort_values)
        ].compact

        Arelastic::Nodes::Grouping.new searches
      end

      def build_query_and_filter(query, filters)
        query = build_query(query)
        filter = build_filter(filters)
        if query && filter
          search.query.filtered(query, filter)
        elsif query
          query
        elsif filter
          search.query.constant_score(filter)
        else
          search.query.match_all
        end
      end

      def build_query(query)
        if query.is_a?(String)
          query = Arelastic::Queries::QueryString.new query
        end

        if query
          Arelastic::Searches::Query.new query
        end
      end

      def build_filter(filters)
        nodes = []

        filters.map do |filter|
          if filter.is_a?(Arelastic::Filters::Filter)
            nodes << filter
          else
            filter.each do |field, terms|
              nodes << (terms.is_a?(Array) ? Arelastic::Filters::Terms : Arelastic::Filters::Term).new(field, terms)
            end
          end
        end

        if nodes.size == 1
          Arelastic::Searches::Filter.new nodes.first
        elsif nodes.size > 1
          Arelastic::Searches::Filter.new Arelastic::Filters::And.new(nodes)
        end
      end

      def build_limit(limit)
        if limit
          Arelastic::Searches::Size.new(limit)
        end
      end

      def build_offset(offset)
        if offset
          Arelastic::Searches::From.new(offset)
        end
      end

      def build_facets(facets)
        nodes = []

        facets.each do |facet|
          if facet.is_a?(Arelastic::Facets::Facet)
            nodes << facet
          else
            facet.each do |name, value|
              nodes << {name => value}
            end
          end
        end

        Arelastic::Searches::Facets.new(nodes) unless nodes.empty?
      end

      def build_sorts(sorts)
        Arelastic::Searches::Sort.new(sorts) unless sorts.empty?
      end
  end
end