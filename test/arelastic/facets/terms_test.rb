require 'helper'

class Arelastic::Facets::TermsTest < MiniTest::Unit::TestCase
  def test_as_elastic
    facet = Arelastic::Facets::Terms.new('foo', 'tags', "size" => 10)
    expected = {
      "foo" => {
        "terms" => {
          "field" => "tags",
          "size"  => 10,
        }
      }
    }

    assert_equal expected, facet.as_elastic
  end

  def test_nested
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