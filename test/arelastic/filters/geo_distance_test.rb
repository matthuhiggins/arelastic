require 'helper'

class Arelastic::Filters::GeoDistanceTest < MiniTest::Spec
  def test_as_elastic
    expected = {
      "geo_distance" => {
        "distance" => "12km",
        "pin.location" => [40, -70]
      }
    }

    assert_equal expected, Arelastic::Filters::GeoDistance.new('pin.location', '12km', [40, -70]).as_elastic
  end
end