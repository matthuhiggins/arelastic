module Arelastic
  module Builders
    class Filter < Struct.new :field
      class << self
        def [](field)
          new(field)
        end

        def ids *ids
          Arelastic::Queries::Ids.new ids.flatten
        end

        def not expr
          Arelastic::Queries::Bool.new must_not: expr
        end
      end

      def eq other
        Arelastic::Queries::Term.new field, other
      end

      def not_eq other
        self.class.not eq(other)
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
          Arelastic::Queries::Terms.new field, other, options
        end
      end

      def not_in other, options = {}
        self.class.not self.in(other, options)
      end

      def prefix other
        Arelastic::Queries::Prefix.new field, other
      end

      def exists(options = {})
        Arelastic::Queries::Exists.new field, options
      end

      def missing(options = {})
        exists(options).negate
      end

      def regexp other
        Arelastic::Queries::Regexp.new field, other
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

      private
        def range options
          Arelastic::Queries::Range.new field, options
        end
    end
  end
end
