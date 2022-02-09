require 'helper'

class Arelastic::Aggregations::SumTest < Minitest::Test
  def test_as_elastic
    aggregation = Arelastic::Aggregations::Sum.new('foo', 'field' => 'bar_count')

    expected = {
      "foo" => {
        "sum" => {
          "field" => "bar_count"
        }
      }
    }
    assert_equal expected, aggregation.as_elastic
  end
end
