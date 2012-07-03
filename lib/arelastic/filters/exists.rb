module Arelastic
  module Filters
    class Exists < Arelastic::Filters::Filter
      attr_reader :field

      def initialize field
        @field = field
      end

      def as_elastic
        {"exists" => { "field" => field }}
      end
    end
  end
end