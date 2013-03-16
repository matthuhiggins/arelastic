require 'helper'

class Arelastic::Filters::QueryTest < MiniTest::Unit::TestCase
  def test_as_elastic
    expected = {"query" => { "match" => {"message" => "this is a test"} }}

    assert_equal expected, Arelastic::Filters::Query.new(Arelastic::Queries::Match.new('message', 'this is a test')).as_elastic
  end

  def test_with_string
    expected = {'query' => { 'query_string' => {'query' => 'blue dog'}}}

    assert_equal expected, Arelastic::Filters::Query.new("blue dog").as_elastic
  end
end