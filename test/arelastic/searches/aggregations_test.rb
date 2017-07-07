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

  def test_nested
    aggregations = Arelastic::Searches::Aggregations.new "favorites" => {"terms" => {"field" => "pencils.color"}}
    nested = aggregations.nested("pencil_colors", "pencils")

    expected = {
      "pencil_colors" => {
        "nested" => {
          "path" => "pencils"
        },
        "aggs" => {
          "favorites" => {
            "terms" => {
              "field"=>"pencils.color"
            }
          }
        }
      }
    }

    assert_equal expected, nested.as_elastic
  end

  def test_reverse_nested
    aggregations = Arelastic::Searches::Aggregations.new "favorites" => { "terms" => { "field" => "pencils.color" } }
    nested = aggregations.reverse_nested("pencil_colors", "pencils")

    expected = {
      "pencil_colors" => {
        "reverse_nested" => {
          "path" => "pencils"
        },
        "aggs" => {
          "favorites" => {
            "terms" => {
              "field"=>"pencils.color"
            }
          }
        }
      }
    }

    assert_equal expected, nested.as_elastic
  end
end
