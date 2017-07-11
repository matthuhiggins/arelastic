require 'helper'

class Arelastic::Queries::GeoDistanceTest < Minitest::Test
  def test_as_elastic
    expected = {
      "geo_distance" => {
        "pin.location" => [40, -70],
        "distance" => "12km"
      }
    }

    assert_equal expected, Arelastic::Queries::GeoDistance.new('pin.location', [40, -70], '12km').as_elastic
  end
end