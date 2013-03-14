module Arelastic
  module Mappings
    class Type < Arelastic::Nodes::Node
      def self.for_type(type)
      end

      def as_elastic
        {
          "type" => type_name
        }
      end
    end
  end
end