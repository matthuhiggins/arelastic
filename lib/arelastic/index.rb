module Arelastic
  class Index
    def [](field)
      Arelastic::Field.new(field.to_s)
    end

    def filtered(query, filter)
      Arelastic::Searches::Query.new(Arelastic::Queries::Filtered.new(query, filter))
    end

    def constant_score(filter_or_query)
      Arelastic::Searches::Query.new(Arelastic::Queries::ConstantScore.new(filter_or_query))
    end
  end
end