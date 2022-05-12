module Arelastic
  module Queries
    class Bool < Arelastic::Queries::Query
      attr_accessor :must, :filter, :should, :must_not, :options
      def initialize(options)
        @must     = read_option! options, 'must'
        @filter   = read_option! options, 'filter'
        @should   = read_option! options, 'should'
        @must_not = read_option! options, 'must_not'
        @options  = options
      end

      def as_elastic
        searches = {}

        {
          'must'     => must,
          'filter'   => filter,
          'should'   => should,
          'must_not' => must_not
        }.each do |k, v|
          if v.is_a?(Array)
            v = merge_expression(k, v, klass: Queries::HasParent, merge_test_method: :parent_type)
            v = merge_expression(k, v, klass: Queries::HasChild, merge_test_method: :type)
            v = merge_expression(k, v, klass: Queries::Nested, merge_test_method: :path_and_options)
          end

          searches[k] = convert_to_elastic(v) if v
        end

        { 'bool' => searches.update(options) }
      end

      def merge_expression(clause, expr, klass:, merge_test_method:)
        mergeable, other = expr.partition { |el| el.is_a?(klass) }
        merged = mergeable.group_by(&merge_test_method).flat_map do |_, group|
          if group.size > 1
            group.first.instance_variable_set("@query", self.class.new(clause => group.map(&:query)))
            group.first
          else
            group
          end
        end
        merged + other
      end
    end
  end
end
