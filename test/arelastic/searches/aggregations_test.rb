require 'helper'

class Arelastic::Searches::AggregationsTest < MiniTest::Spec
  def test_as_elastic
    aggregations = Arelastic::Searches::Aggregations.new(
      Arelastic::Aggregations::Terms.new('popular_tags', 'field' => 'tags', 'size' => 10),
      "colorful" => {"filter" => {"exists" => {"field" => "color"}}}
    )

    expected = {
      "aggs" => {
        "popular_tags" => {
          "terms" => {
            "field" => "tags",
            "size" => 10
          }
        },
        "colorful" => {
          "filter" => {
            "exists" => {
              "field" => "color"
            }
          }
        }
      }
    }
    assert_equal expected, aggregations.as_elastic
  end
end