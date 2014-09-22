module Arelastic
  module Aggregations
    class Terms < Arelastic::Aggs::Aggregation
      attr_accessor :field, :options

      def initialize field, options = {}
        @field = field
        @options = options
      end

      def as_elastic
        params = {"field" => field}.update(options)

        {"terms" => params}
      end
    end
  end
end
