module Arelastic
  module Queries
    class ConstantScore < Arelastic::Query
      attr_accessor :search
      def initialize(search)
        @search = search
      end

      def to_elastic
        { "constant_score" => search.to_elastic }
      end
    end
  end
end