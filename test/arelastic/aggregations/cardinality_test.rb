require 'helper'

class Arelastic::Aggregations::CardinalityTest < Minitest::Test
  def test_as_elastic
    aggregation = Arelastic::Aggregations::Cardinality.new('foo', 'field' => 'name')

    expected = {
      "foo" => {
        "cardinality" => {
          "field" => "name"
        }
      }
    }
    assert_equal expected, aggregation.as_elastic
  end
end
