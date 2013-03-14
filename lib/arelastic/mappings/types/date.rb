module Arelastic
  module Mappings
    class Date < Arelastic::Mappings::Type
      for_type 'date'
    end
  end
end