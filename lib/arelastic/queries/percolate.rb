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
            "field"                  => field,
            document_parameter_name  => document
          }.merge(options)
        }
      end

      def document_parameter_name
        document.is_a?(Array) ? "documents" : "document"
      end
    end
  end
end
