require 'helper'

class Arelastic::Aggregations::MaxTest < Minitest::Test
  def test_as_elastic
    aggregation = Arelastic::Aggregations::Max.new('max_segment_id', 'field' => 'segment_id')

    expected = {
      "max_segment_id" => {
        "max" => {
          "field" => "segment_id"
        }
      }
    }
    assert_equal expected, aggregation.as_elastic
  end
end
