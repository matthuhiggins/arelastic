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

  def test_reverse_nested
    aggregation = Arelastic::Aggregations::Min.new('smallest', 'field' => 'pets.weight').reverse_nested('pets')

    expected = {
      "smallest" => {
        "reverse_nested" => {
          "path" => "pets"
        },
        "aggs" => {
          "smallest" => {
            "min" => { "field" => "pets.weight" }
          }
        }
      }
    }

    aggregation = Arelastic::Aggregations::Min.new('youngest', 'field' => 'age').reverse_nested

    expected = {
      "youngest" => {
        "reverse_nested" => {},
        "aggs" => {
          "youngest" => {
            "min" => { "field" => "age" }
          }
        }
      }
    }
  end
end
