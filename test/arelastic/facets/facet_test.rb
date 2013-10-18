require 'helper'

class Arelastic::Facets::FacetTest < MiniTest::Unit::TestCase
  def test_nested
    facet = Class.new(Arelastic::Facets::Facet) do
      def as_elastic_facet
        {}
      end
    end.new 'name'

    expected = {
      "name" => {"nested" => "links"}
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
        },
        "nested" => "links"
      }
    }

    nested = facet.nested "links"

    assert_equal expected, nested.as_elastic
  end
end