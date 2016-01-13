require 'helper'

class Arelastic::Filters::GeoBoundingBoxTest < Minitest::Test
  def test_as_elastic
    expected = {
      "geo_bounding_box" => {
        "location" => {
          "top_left" => [40, -70],
          "bottom_right" => [30, -60]
        }
      }
    }

    assert_equal(
      expected,
      Arelastic::Filters::GeoBoundingBox.new('location', 'top_left' => [40, -70], 'bottom_right' => [30, -60]).as_elastic
    )
  end

  def test_as_elastic_with_options
    expected = {
      "geo_bounding_box" => {
        "index" => true,
        "location" => {
          "top_left" => [40, -70],
          "bottom_right" => [30, -60]
        }
      }
    }

    assert_equal(
      expected,
      Arelastic::Filters::GeoBoundingBox.new('location', {'top_left' => [40, -70], 'bottom_right' => [30, -60]}, 'index' => true).as_elastic
    )
  end
end