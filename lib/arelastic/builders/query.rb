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

        def bool(must: nil, filter: nil, should: nil, must_not: nil)
          query Arelastic::Queries::Bool.new(must: must, filter: filter, should: should, must_not: must_not)
        end

        def match_all
          query Arelastic::Queries::MatchAll.new
        end

        def multi_match(query, fields, options = {})
          query Arelastic::Queries::MultiMatch.new query, fields, options
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
