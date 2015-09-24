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

      def as_elastic
        params = {'path' => path}.update(convert_to_elastic(expr))

        { 'nested' => params }
      end
    end
  end
end