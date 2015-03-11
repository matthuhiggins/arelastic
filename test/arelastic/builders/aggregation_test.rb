require 'helper'

class Arelastic::Builders::AggregationTest < Minitest::Test
  def test_terms
    expected = {"name" => {"terms" => {"field" => "term"}}}
    actual = Arelastic::Builders::Aggregation['name'].terms('term').as_elastic

    assert_equal expected, actual
  end
end
