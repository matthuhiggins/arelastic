require 'helper'

class Arelastic::Aggregations::FilterTest < Minitest::Test
  def test_as_elastic
    aggregation = Arelastic::Aggregations::Filter.new('foo', 'exists' => {'field' => 'color'})
    expected = {
      "foo" => {
        "filter" => {
          "exists" => {
            "field" => "color"
          }
        }
      }
    }

    assert_equal expected, aggregation.as_elastic
  end

  def test_as_elastic_with_node
    aggregation = Arelastic::Aggregations::Filter.new('foo', Arelastic::Queries::Exists.new('color'))
    expected = {
      "foo" => {
        "filter" => {
          "exists" => {
            "field" => "color"
          }
        }
      }
    }

    assert_equal expected, aggregation.as_elastic
  end
end
