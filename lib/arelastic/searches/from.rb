module Arelastic
  module Searches
    class From < Arelastic::Search
      attr_accessor :value
      def initialize(value)
        @value = value
      end

      def to_elastic
        {"from" => value}
      end
    end
  end
end