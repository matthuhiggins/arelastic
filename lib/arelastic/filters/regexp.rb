module Arelastic
  module Filters
    #
    # Implements support for the Regexp filter.
    #
    # Does not support Ruby `Regexp` objects, because Elasticsearch's regular
    # expression syntax only supports a subset of the operators usually
    # implemented in a fully-featured regex engine.
    #
    # Reference: https://www.elastic.co/guide/en/elasticsearch/reference/1.7/query-dsl-regexp-filter.html
    #
    class Regexp < Filter
      binary 'regexp'

      def convert_to_elastic(expr)
        if expr.is_a?(::Regexp)
          raise TypeError.new('Regexp objects are not allowed to be Regexp filter values')
        end

        super
      end
    end
  end
end
