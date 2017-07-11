require 'helper'

class Arelastic::Queries::IdsTest < Minitest::Test
  def test_as_elastic
    expected = {"ids" => {"values" => ["foo", "bar"]}}

    assert_equal expected, Arelastic::Queries::Ids.new(['foo', 'bar']).as_elastic
  end
end