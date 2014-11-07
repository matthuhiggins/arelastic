require 'helper'

class Arelastic::Facets::DateHistogramTest < MiniTest::Unit::TestCase
  def test_as_elastic
    facet = Arelastic::Facets::DateHistogram.new('histo', "field" => "field_name", "interval" => "day")
    expected = {
      "histo" => {
        "date_histogram" => {
          "field" => "field_name",
          "interval" => "day"
        }
      }
    }

    assert_equal expected, facet.as_elastic
  end
end
