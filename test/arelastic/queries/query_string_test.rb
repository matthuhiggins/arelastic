require 'helper'

class Arelastic::Queries::QueryStringTest < MiniTest::Unit::TestCase
  def test_as_elastic
    query_string = Arelastic::Queries::QueryString.new('foo')
    expected = {"query_string" => {"query" => "foo"}}

    assert_equal expected, query_string.as_elastic
  end
end