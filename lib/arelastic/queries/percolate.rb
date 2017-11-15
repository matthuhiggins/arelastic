module Arelastic
  module Queries
    class Percolate < Query
      attr_accessor :field, :document, :options
      def initialize(field, document, options = {})
        @field    = field
        @document = document
        @options  = options
      end

      def as_elastic
        {
          "percolate" => {
            "field"     => field,
            "document"  => document
          }.merge(options)
        }
      end
    end
  end
end
