require 'helper'

class Arelastic::Builders::AggregationTest < Minitest::Test
  def test_terms
    expected = {"name" => {"terms" => {"field" => "color"}}}
    actual = Arelastic::Builders::Aggregation['name'].terms('field' => 'color').as_elastic

    assert_equal expected, actual
  end
end
