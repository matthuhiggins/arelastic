require 'helper'

class Arelastic::Queries::FilterTest < Minitest::Test
  def test_nested
    filter = Arelastic::Queries::Term.new('foo', 'bar')

    nested_filter = filter.nested 'links'

    assert nested_filter.is_a?(Arelastic::Queries::Nested)
    expected = {
      "nested" => {
        "path" => "links",
        "query" => {
          "term" => {
            "foo" => "bar"
          }
        }
      }
    }
    assert_equal(expected, nested_filter.as_elastic)
  end
end
