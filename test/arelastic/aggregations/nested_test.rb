require 'helper'

class Arelastic::Aggregations::NestedTest < Minitest::Test
  def test_as_elastic
    aggregation = Arelastic::Aggregations::Nested.new('favorite', 'movies', [
      Arelastic::Aggregations::Terms.new('foo', 'field' => 'tags', 'size' => 10)
    ])

    expected = {
      "favorite" => {
        "nested" => {
          "path" => "movies"
        },
        "aggs" => {
          "foo" => {
            "terms" => {
              "field" => "tags",
              "size" => 10
            }
          }
        }
      }
    }
    assert_equal expected, aggregation.as_elastic
  end
end
