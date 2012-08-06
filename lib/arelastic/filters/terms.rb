module Arelastic
  module Filters
    class Terms < Arelastic::Filters::Filter
      attr_accessor :field, :terms, :options
      def initialize(field, terms, options = {})
        @field = field
        @terms = terms
        @options = options
      end

      def as_elastic
        params = {field => terms}.update(options)

        { "terms" => params }
      end
    end
  end
end