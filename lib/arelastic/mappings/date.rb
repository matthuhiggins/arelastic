module Arelastic
  module Mappings
    class Date < Arelastic::Mappings::Mapping
      for_type 'date'
    end
  end
end