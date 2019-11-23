module Arelastic
  module Builders
    class Queries < Struct.new :name
      MACROS_TO_ARELASTIC = {
        bool:                Arelastic::Queries::Bool,
        constant_score:      Arelastic::Queries::ConstantScore,
        dis_max:             Arelastic::Queries::DisMax,
        exists:              Arelastic::Queries::Exists,
        field:               Arelastic::Queries::Field,
        filter:              Arelastic::Queries::Filter,
        function_score:      Arelastic::Queries::FunctionScore,
        fuzzy:               Arelastic::Queries::Fuzzy,
        geo_bounding_box:    Arelastic::Queries::GeoBoundingBox,
        geo_distance:        Arelastic::Queries::GeoDistance,
        geo_polygon:         Arelastic::Queries::GeoPolygon,
        has_child:           Arelastic::Queries::HasChild,
        ids:                 Arelastic::Queries::Ids,
        limit:               Arelastic::Queries::Limit,
        match:               Arelastic::Queries::Match,
        match_all:           Arelastic::Queries::MatchAll,
        match_none:          Arelastic::Queries::MatchNone,
        match_phrase:        Arelastic::Queries::MatchPhrase,
        multi_match:         Arelastic::Queries::MultiMatch,
        nested:              Arelastic::Queries::Nested,
        percolate:           Arelastic::Queries::Percolate,
        prefix:              Arelastic::Queries::Prefix,
        query:               Arelastic::Queries::Query,
        query_string:        Arelastic::Queries::QueryString,
        range:               Arelastic::Queries::Range,
        regexp:              Arelastic::Queries::Regexp,
        script:              Arelastic::Queries::Script,
        simple_query_string: Arelastic::Queries::SimpleQueryString,
        term:                Arelastic::Queries::Term,
        terms:               Arelastic::Queries::Terms,
        wildcard:            Arelastic::Queries::Wildcard
      }

      class << self
        def [](field)
          new(field)
        end

        MACROS_TO_ARELASTIC.each do |macro, klass|
          define_method macro do |*args|
            klass.new(*args)
          end
        end
      end

      MACROS_TO_ARELASTIC.each do |macro, klass|
        define_method macro do |*args|
          klass.new(name, *args)
        end
      end

      def in other, options = {}
        case other
        when Range
          if other.exclude_end?
            range 'gte' => other.begin, 'lt' => other.end
          else
            range 'gte' => other.begin, 'lte' => other.end
          end
        else
          terms other, options
        end
      end

      def missing(options = {})
        exists(options).negate
      end

      def gte other
        range 'gte' => other
      end

      def gt other
        range 'gt' => other
      end

      def lte other
        range 'lte' => other
      end

      def lt other
        range 'lt' => other
      end
    end
  end
end
