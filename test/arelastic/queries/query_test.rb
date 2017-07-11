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

  def test_negate
    filter = Arelastic::Queries::Term.new 'foo', 'bar'

    negated_filter = filter.negate

    assert negated_filter.is_a?(Arelastic::Queries::Bool)
    assert_equal filter, negated_filter.must_not
  end
end
