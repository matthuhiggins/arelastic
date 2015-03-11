require 'helper'

class Arelastic::Aggregations::AggregationTest < Minitest::Test
  def test_nested
    aggregation = Arelastic::Aggregations::Min.new('smallest', 'field' => 'pets.weight').nested('pets')

    expected = {
      "smallest" => {
        "nested" => {
          "path" => "pets"
        },
        "aggs" => {
          "smallest" => {
            "min" => { "field" => "pets.weight" }
          }
        }
      }
    }

    assert_equal expected, aggregation.as_elastic
  end
end