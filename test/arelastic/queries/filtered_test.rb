require 'helper'

class Arelastic::Queries::FilteredTest < MiniTest::Spec
  def test_as_elastic
    filtered = Arelastic::Queries::Filtered.new({"query" => "bar"}, {"filter" => "baz"})
    expected = {"filtered" => {"query" => "bar", "filter" => "baz"}}

    assert_equal expected, filtered.as_elastic
  end
end