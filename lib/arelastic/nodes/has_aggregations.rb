module Arelastic
  module Nodes
    module HasAggregations
      class_eval do
        attr_accessor :aggs
      end

      def aggs_as_elastic
        if aggs.any?
          { 'aggs' => build_aggs_as_elastic }
        else
          {}
        end
      end

      private

        def build_aggs_as_elastic
          grouping = Arelastic::Nodes::HashGroup.new aggs
          grouping.as_elastic
        end
    end
  end
end
