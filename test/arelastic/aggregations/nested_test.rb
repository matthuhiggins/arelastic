require 'helper'

class Arelastic::Aggregations::NestedTest < Minitest::Test
  def test_as_elastic
    aggregation = Arelastic::Aggregations::Nested.new('favorite', 'movies', [

    ])
  end
end