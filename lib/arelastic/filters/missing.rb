module Arelastic
  module Filters
    class Missing < Arelastic::Filters::Filter
      attr_reader :field

      def initialize field
        @field = field
      end

      def as_elastic
        {"missing" => { "field" => field }}
        # "existence" : true defaults to true
        # "null_value" : true defaults to false
      end
    end
  end
end