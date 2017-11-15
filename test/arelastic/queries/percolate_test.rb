require 'helper'

class Arelastic::Queries::PercolateTest < Minitest::Test
  def test_as_elastic
    percolate = Arelastic::Queries::Percolate.new("query", {"color" => "red"})
    expected = {
      "percolate" => {
        "field" => "query",
        "document" => {"color" => "red"}
      }
    }
    assert_equal expected, percolate.as_elastic
  end

  def test_as_elastic_with_options
    percolate = Arelastic::Queries::Percolate.new("query", {"color" => "red"}, {"document_type" => "widget"})
    expected = {
      "percolate" => {
        "field" => "query",
        "document" => {"color" => "red"},
        "document_type" => "widget"
      }
    }
    assert_equal expected, percolate.as_elastic
  end
end
