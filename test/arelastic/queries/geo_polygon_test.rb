require 'helper'

class Arelastic::Queries::GeoDistanceTest < Minitest::Test
  def test_as_elastic
    points = [
      {"lat" => 47.15, "lon" => -124.33},
      {"lat" => 46.63, "lon" => -124.42},
      {"lat" => 46.15, "lon" => -123.84}
    ]
    expected = {
      "geo_polygon" => {
        "person.location" => {
          "points" => points
        }
      }
    }

    assert_equal expected, Arelastic::Queries::GeoPolygon.new('person.location', points).as_elastic
  end
end
