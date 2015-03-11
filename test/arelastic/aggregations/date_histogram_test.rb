require 'helper'

class Arelastic::Aggregations::DateHistogramTest < Minitest::Test
  def test_as_elastic
    aggregation = Arelastic::Aggregations::DateHistogram.new('foo', 'field' => 'birthdate', 'interval' => 'month')

    expected = {
      "foo" => {
        "date_histogram" => {
          "field" => "birthdate",
          "interval" => "month"
        }
      }
    }
    assert_equal expected, aggregation.as_elastic
  end
end
