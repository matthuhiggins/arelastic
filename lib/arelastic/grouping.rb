module Arelastic
  class Grouping
    attr_accessor :nodes
    def initialize nodes
      @nodes = nodes
    end

    def to_elastic
      result = {}
      nodes.each { |node| result.merge! node.to_elastic }
      result
    end
  end
end