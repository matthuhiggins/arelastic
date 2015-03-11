require 'helper'

class Arelastic::Builders::FacetTest < Minitest::Test
  def test_terms
    expected = {"name" => {"terms" => {"field" => "term"}}}
    actual = Arelastic::Builders::Facet['name'].terms('term').as_elastic
    assert_equal expected, actual
  end
end
