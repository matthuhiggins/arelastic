require 'helper'

class Arelastic::Aggregations::BucketTest < Minitest::Test
  def test_as_elastic_with_sub_aggregations
    aggregation = Arelastic::Aggregations::Terms.new('foo',
      'field' => 'tags',
      'size' => 10,
      'aggs' => [
        Arelastic::Aggregations::Terms.new('colors', 'field' => 'color')
      ]
    )

    expected = {
      "foo" => {
        "terms" => {
          "field" => "tags",
          "size"  => 10,
        },
        "aggs"  => {
          "colors" => {
            "terms" => {
              "field" => "color"
            }
          }
        }
      }
    }
    assert_equal expected, aggregation.as_elastic
  end
end
