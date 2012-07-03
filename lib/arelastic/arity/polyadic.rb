attr_reader :children

def initialize children = []
  @children = children
end

def as_elastic
  {'and' => children.map { |child| child.as_elastic }}
end
