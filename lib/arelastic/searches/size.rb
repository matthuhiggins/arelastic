module Arelastic
  module Searches
    class Size < Arelastic::Search
      attr_accessor :value
      def initialize(value)
        @value = value
      end

      def to_elastic
        {"size" => value}
      end
    end
  end
end