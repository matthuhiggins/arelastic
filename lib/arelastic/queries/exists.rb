module Arelastic
  module Queries
    class Exists < Arelastic::Queries::Query
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
