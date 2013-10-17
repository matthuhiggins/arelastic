require 'helper'

class Arelastic::Builders::FacetTest < MiniTest::Unit::TestCase
  def test_terms
    expected = {"name"=>{"terms"=>{"field"=>"term"}}}
    actual = Arelastic::Builders::Facet['name'].terms('term').as_elastic
    assert_equal expected, actual
  end
end