require 'helper'

class Arelastic::Queries::FilteredTest < Minitest::Test
  def test_as_elastic
    filtered = Arelastic::Queries::Filtered.new(
      query: {"query_string" => "bar"},
      filter: {"term" => "baz"}
    )
    expected = {"filtered" => {"query" => {"query_string" => "bar"}, "filter" => {"term" => "baz"}}}

    assert_equal expected, filtered.as_elastic
  end

  def test_as_elastic_with_query_node
    filtered = Arelastic::Queries::Filtered.new(query: Arelastic::Queries::QueryString.new("bar"))
    expected = {"filtered" => {"query" => {"query_string" => {"query"=>"bar"}}}}

    assert_equal expected, filtered.as_elastic
  end
end
