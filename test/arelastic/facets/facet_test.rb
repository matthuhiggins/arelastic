require 'helper'

class Arelastic::Facets::FacetTest < MiniTest::Unit::TestCase
  def test_nested
    facet = Arelastic::Facets::Facet.new
    expected = {
      "nested" => "links"
    }

    nested = facet.nested "links"

    assert_equal expected, nested.as_elastic
  end

  def test_nested_terms
    facet = Arelastic::Facets::Terms.new('foo', 'links.name', "size" => 10)
    expected = {
      "foo" => {
        "terms" => {
          "field" => "links.name",
          "size"  => 10,
        }
      },
      "nested" => "links"
    }

    nested = facet.nested "links"

    assert_equal expected, nested.as_elastic
  end
end