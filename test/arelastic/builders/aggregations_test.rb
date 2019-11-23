require 'helper'

class Arelastic::Builders::AggregationsTest < Minitest::Test
  def test_terms
    expected = {"name" => {"terms" => {"field" => "color"}}}
    actual = Arelastic::Builders::Aggregations.terms('name', 'field' => 'color').as_elastic

    assert_equal expected, actual
  end
end
