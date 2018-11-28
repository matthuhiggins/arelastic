module Arelastic
  module Builders
    module QueryBuilder
      MACROS_TO_ARELASTIC = {
        bool:         Arelastic::Queries::Bool,
        ids:          Arelastic::Queries::Ids,
        match_all:    Arelastic::Queries::MatchAll,
        match_none:   Arelastic::Queries::MatchNone,
        match_phrase: Arelastic::Queries::MatchPhrase,
        prefix:       Arelastic::Queries::Prefix,
        term:         Arelastic::Queries::Term,
        terms:        Arelastic::Queries::Terms
      }

      def self.included(base)
        base.class_eval do
          extend ClassMethods
        end
      end

      module ClassMethods
        MACROS_TO_ARELASTIC.each do |macro, klass|
          define_method macro do |*args|
            klass.new(*args)
          end
        end
      end
    end
  end
end
