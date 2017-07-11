module Arelastic
  module Queries
    class Ids < Arelastic::Queries::Query
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

