attr_accessor :expr
def initialize(expr)
  raise "#{expr.inspect} must be an Arelastic::Filter" unless expr.is_a?(Arelastic::Filter)
  @expr = expr
end

def to_elastic
  {"filter" => expr}
end
