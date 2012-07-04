module Arelastic
  module Filters
    class Missing < Arelastic::Filters::Filter
      attr_reader :field, :options

      # Options:
      #   "existence" => true defaults to true
      #   "null_value" => true defaults to false
      def initialize field, options = {}
        @field = field
        @options = options
      end

      def as_elastic
        params = {"field" => field}.update(options)
        {"missing" => params}
      end
    end
  end
end