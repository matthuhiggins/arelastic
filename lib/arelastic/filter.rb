module Arel
  class Filter
    def or right
      Filter::Grouping.new Filter::Or.new(self, right)
    end

    def and right
      Filter::And.new [self, right]
    end
  end
end