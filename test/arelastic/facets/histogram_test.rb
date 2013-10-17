require 'helper'

class Arelastic::Facets::HistogramTest < MiniTest::Unit::TestCase
  def test_as_elastic
    facet = Arelastic::Facets::Histogram.new('histo', "field" => "field_name", "interval" => 100)
    expected = {
      "histo" => {
        "histogram" => {
          "field" => "field_name",
          "interval" => 100
        }
      }
    }

    assert_equal expected, facet.as_elastic
  end
end