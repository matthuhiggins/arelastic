module Arelastic
  module Filters
    class Ids < Arelastic::Filters::Filter
      attr_reader :values

      def initialize values
        @values = values
      end

      def as_elastic
        { "ids" => { "values" => values }}
      end
    end
  end
end

