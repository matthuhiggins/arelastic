require 'helper'

class Arelastic::Filters::GeoDistanceTest < MiniTest::Spec
  def test_as_elastic
    expected = {
      "geo_distance" => {
        "pin.location" => [40, -70],
        "distance" => "12km"
      }
    }

    assert_equal expected, Arelastic::Filters::GeoDistance.new('pin.location', [40, -70], '12km').as_elastic
  end
end