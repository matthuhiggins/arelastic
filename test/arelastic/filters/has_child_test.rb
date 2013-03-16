require 'helper'

class Arelastic::Filters::HasChildTest < MiniTest::Unit::TestCase
  def test_as_elastic
    expected = {"has_child" => {"type" => "comment", "query" => {"query_string" => "lol"}}}

    assert_equal expected, Arelastic::Filters::HasChild.new("comment", {"query_string" => "lol"}).as_elastic
  end
end