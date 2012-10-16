require 'helper'

class Arelastic::Queries::FilteredTest < MiniTest::Spec
  def test_as_elastic
    filtered = Arelastic::Queries::Filtered.new({"query_string" => "bar"}, {"term" => "baz"})
    expected = {"filtered" => {"query" => {"query_string" => "bar"}, "filter" => {"term" => "baz"}}}

    assert_equal expected, filtered.as_elastic
  end
end