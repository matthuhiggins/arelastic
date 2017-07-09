require 'helper'

class Arelastic::Filters::FilterTest < Minitest::Test
  def test_nested
    filter = Arelastic::Filters::Term.new('foo', 'bar')

    nested_filter = filter.nested 'links'

    assert nested_filter.is_a?(Arelastic::Queries::Nested)
    expected = {
      "nested" => {
        "path" => "links",
        "query" => {
          "constant_score" => {
            "term" => {
              "foo" => "bar"
            }
          }
        }
      }
    }
    assert_equal(expected, nested_filter.as_elastic)
  end
end
