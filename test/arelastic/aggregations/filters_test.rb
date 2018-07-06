require 'helper'

class Arelastic::Aggregations::FiltersTest < Minitest::Test
  def test_as_elastic_with_array
    aggregation = Arelastic::Aggregations::Filters.new 'foo', [
      {'exists' => {'field' => 'color'}},
      Arelastic::Queries::Exists.new('price')
    ]

    expected = {
      "foo" => {
        "filters" => {
          "filters" => [
            {
              "exists" => {
                "field" => "color"
              },
            },
            {
              "exists" => {
                "field" => "price"
              }
            }
          ]
        }
      }
    }

    assert_equal expected, aggregation.as_elastic
  end

  def test_as_elastic_with_hash
    aggregation = Arelastic::Aggregations::Filters.new 'foo', {
      'color_count' => {'exists' => {'field' => 'color'}},
      'price_count' => Arelastic::Queries::Exists.new('price')
    }

    expected = {
      "foo" => {
        "filters" => {
          "filters" => {
            "color_count" => {
              "exists" => {
                "field" => "color"
              }
            },
            "price_count" => {
              "exists" => {
                "field" => "price"
              }
            }
          }
        }
      }
    }

    assert_equal expected, aggregation.as_elastic
  end
end
