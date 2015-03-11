require 'helper'

class Arelastic::Queries::WildcardTest < Minitest::Test
  def test_as_elastic
    expected = {"wildcard" => {"foo" => "bar*"}}

    assert_equal expected, Arelastic::Queries::Wildcard.new("foo", "bar*").as_elastic
  end

  def test_with_options
    expected = {"wildcard" => {"foo" => {"wildcard" => "ki*y", "boost" => 2.0}}}

    assert_equal expected, Arelastic::Queries::Wildcard.new("foo", "wildcard" => "ki*y", "boost" => 2.0 ).as_elastic
  end
end
