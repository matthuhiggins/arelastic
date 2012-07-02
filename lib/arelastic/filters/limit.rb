module Arelastic
  module Filters
    class Limit < Arelastic::Filter
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