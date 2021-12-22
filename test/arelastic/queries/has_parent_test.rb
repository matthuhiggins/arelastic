require 'helper'

class Arelastic::Queries::HasParentTest < Minitest::Test
  def test_as_elastic
    expected = {"has_parent" => {"parent_type" => "user", "query" => {"query_string" => "foo"}}}

    assert_equal expected, Arelastic::Queries::HasParent.new("user", {"query_string" => "foo"}).as_elastic
  end
end
