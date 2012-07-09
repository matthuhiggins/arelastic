module Arelastic
  module Builders
    class Sort < Struct.new :field
      class << self
        def [](field)
          new(field)
        end
      end

      def asc
        
      end
    end
  end
end