module Arelastic
  module Queries
    class Bool < Arelastic::Queries::Query
      attr_accessor :options
      def initialize(options)
        @options = options
      end

      def as_elastic
        params = {}
        options.each do |key, value|
          params[key] = convert_to_elastic(value)
        end

        { "bool" => params }
      end
    end
  end
end
