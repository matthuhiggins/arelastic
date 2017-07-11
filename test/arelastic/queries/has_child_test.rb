require 'helper'

class Arelastic::Queries::HasChildTest < Minitest::Test
  def test_as_elastic
    expected = {"has_child" => {"type" => "comment", "query" => {"query_string" => "lol"}}}

    assert_equal expected, Arelastic::Queries::HasChild.new("comment", {"query_string" => "lol"}).as_elastic
  end
end