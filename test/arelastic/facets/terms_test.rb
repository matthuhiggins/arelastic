require 'helper'

class Arelastic::Facets::TermsTest < MiniTest::Spec
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
end