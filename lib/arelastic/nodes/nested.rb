module Arelastic
  module Nodes
    module Nested
      def self.included(klass)
        klass.class_eval do
          attr_accessor :path, :expr
        end
      end

      def initialize(path, expr)
        @path = path
        @expr = expr
      end

      def search_context
        is_a?(Arelastic::Filters::Filter) ? 'filter' : 'query'
      end

      def as_elastic
        params = {
          'path'          => path,
          search_context  => convert_to_elastic(expr)
        }

        { 'nested' => params }
      end
    end
  end
end