module Arelastic
  class Index
    def [](field)
      Arelastic::Field.new(field.to_s)
    end
  end
end