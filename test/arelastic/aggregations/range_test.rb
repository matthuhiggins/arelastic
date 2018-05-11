require 'helper'

class Arelastic::Aggregations::RangeTest < Minitest::Test
  def test_as_elastic
    aggregation = Arelastic::Aggregations::Range.new('foo', 'field' => 'price', 'ranges' => [
      { 'to' => 100 },
      { 'from' => 100, 'to' => 200 },
      { 'from' => 200 }
    ])

    expected = {
      "foo" => {
        "range" => {
          "field" => "price",
          "ranges" => [
            {"to"=>100},
            {"from"=>100,"to"=>200},
            {"from"=>200}
          ]
        }
      }
    }
    assert_equal expected, aggregation.as_elastic
  end
end
