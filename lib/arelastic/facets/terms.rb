# "terms" : {
#     "field" : "tag",
#     "size" : 10,
#     "order" : "term"
# }module Arelastic
module Arelastic
  module Facets
    class Terms < Arelastic::Facets::Facet
      attr_accessor :name, :field
      def initialize(name, field, options)
        @name = name
        @field = field
      end

      def as_elastic
        {
          name => {
            "terms" => {
              "field" => field
            }
          }
        }
      end
    end
  end
end