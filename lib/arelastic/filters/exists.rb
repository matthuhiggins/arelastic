module Arelastic
  module Filters
    class Exists < Arelastic::Filters::Filter
      attr_reader :field, :options

      # Options:
      #   "null_value" => "_null_"
      def initialize field, options = {}
        @field = field
        @options = options
      end

      def as_elastic
        params = {"field" => field}.update(options)
        {"exists" => params}
      end
    end
  end
end
