module Arelastic
  module Builders
    class Query < Struct.new :name
      class << self
        def [](field)
          new(field)
        end

        def constant_score(search)
          query Arelastic::Queries::ConstantScore.new(search)
        end

        def filtered(query, filter)
          query Arelastic::Queries::Filtered.new(query, filter)
        end

        def match_all
          query Arelastic::Queries::MatchAll.new
        end

        def multi_match other, fields
          # Arelastic::Queries::MultiMatch.new other, fields
        end

        private
          def query value
            Arelastic::Searches::Query.new value
          end
      end

      def field other
        Arelastic::Queries::Field.new name, other
      end

      def term other
        Arelastic::Queries::Term.new name, other
      end

      def terms other
        Arelastic::Queries::Terms.new name, other
      end

      def match other
        Arelastic::Queries::Match.new name, other
      end
    end
  end
end
