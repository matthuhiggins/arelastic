require 'helper'

class Arelastic::Queries::QueryTest < Minitest::Test
  def test_nested
    query = Arelastic::Queries::Term.new('foo', 'bar')

    nested_query = query.nested 'links'

    assert nested_query.is_a?(Arelastic::Queries::Nested)
    expected = {
      "nested" => {
        "path" => "links",
        "query" => query.as_elastic
      }
    }
    assert_equal(expected, nested_query.as_elastic)
  end
end