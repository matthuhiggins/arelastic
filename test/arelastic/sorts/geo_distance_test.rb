require 'helper'

class Arelastic::Sorts::GeoDistanceTest < MiniTest::Spec
  def test_as_elastic
    assert_equal(
      {"_geo_distance" => {"coordinates" => [-70, 40]}},
      Arelastic::Sorts::GeoDistance.new('coordinates', [-70, 40]).as_elastic,
    )
  end

  def test_as_elastic_with_options
    assert_equal(
      {"_geo_distance" => {"coordinates" => [-70, 40], "distance_type" => "plane"}},
      Arelastic::Sorts::GeoDistance.new('coordinates', [-70, 40], 'distance_type' => 'plane').as_elastic,
    )
  end
end