module Arelastic
  module Builders
    class Query < Struct.new :name
      MACROS_TO_ARELASTIC = {
        bool:           Arelastic::Queries::Bool,
        constant_score: Arelastic::Queries::ConstantScore,
        ids:            Arelastic::Queries::Ids,
        field:          Arelastic::Queries::Field,
        match:          Arelastic::Queries::Match,
        match_all:      Arelastic::Queries::MatchAll,
        match_none:     Arelastic::Queries::MatchNone,
        match_phrase:   Arelastic::Queries::MatchPhrase,
        multi_match:    Arelastic::Queries::MultiMatch,
        prefix:         Arelastic::Queries::Prefix,
        term:           Arelastic::Queries::Term,
        terms:          Arelastic::Queries::Terms
      }

      class << self
        def [](field)
          new(field)
        end

        MACROS_TO_ARELASTIC.each do |macro, klass|
          define_method macro do |*args|
            klass.new(*args)
          end
        end
      end

      MACROS_TO_ARELASTIC.each do |macro, klass|
        define_method macro do |*args|
          klass.new(name, *args)
        end
      end
    end
  end
end
