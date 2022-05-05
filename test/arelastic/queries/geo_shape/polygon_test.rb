require 'helper'

class Arelastic::Queries::GeoShape::PolygonTest < Minitest::Test
  def test_as_elastic
    points = [
      [-124.33, 47.15],
      [-124.42, 46.63],
      [-123.84, 46.15]
    ]
    expected = {
      'geo_shape' => {
        'person.location' => {
          'shape' => {
            'type' => 'polygon',
            'coordinates' => [points]
          },
          'relation' => 'within'
        }
      }
    }

    assert_equal expected, Arelastic::Queries::GeoShape::Polygon.new('person.location', points).as_elastic
  end
end
