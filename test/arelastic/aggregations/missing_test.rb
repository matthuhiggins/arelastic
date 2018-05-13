require 'helper'

class Arelastic::Aggregations::MissingTest < Minitest::Test
  def test_as_elastic
    aggregation = Arelastic::Aggregations::Missing.new('foo', 'field' => 'price')

    expected = {
      "foo" => {
        "missing" => {
          "field" => "price"
        }
      }
    }
    assert_equal expected, aggregation.as_elastic
  end
end
