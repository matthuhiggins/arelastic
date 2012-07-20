module Arelastic
  module Builders
    class Filter < Struct.new :field
      class << self
        def [](field)
          new(field)
        end

        def ids(*ids)
          Arelastic::Filters::Ids.new ids.flatten
        end
      end

      def eq other
        Arelastic::Filters::Term.new field, other
      end

      def not_eq other
        self.not eq(other)
      end

      def in other
        Arelastic::Filters::Terms.new field, other
      end

      def not_in other
        self.not self.in(other)
      end

      def prefix other
        Arelastic::Filters::Prefix.new field, other
      end

      def exists
        Arelastic::Filters::Exists.new field
      end

      def missing(options = {})
        Arelastic::Filters::Missing.new field, options
      end

      def gteq other
        range 'gte' => other
      end

      def gt other
        range 'gt' => other
      end

      def lteq other
        range 'lte' => other
      end

      def lt other
        range 'lt' => other
      end

      def not other
        Arelastic::Filters::Not.new other
      end

      private
        def range options
          Arelastic::Filters::Range.new field, options
        end
    end
  end
end