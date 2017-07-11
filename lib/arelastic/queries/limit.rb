module Arelastic
  module Queries
    class Limit < Arelastic::Queries::Query
      attr_reader :value

      def initialize value
        @value = value
      end

      def as_elastic
        {"limit" => {"value" => value}}
      end
    end
  end
end