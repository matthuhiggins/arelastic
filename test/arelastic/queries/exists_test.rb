require 'helper'

class Arelastic::Queries::ExistsTest < Minitest::Test
  def test_as_elastic
    expected = {"exists" => { "field" => "color" }}

    assert_equal expected, Arelastic::Queries::Exists.new('color').as_elastic
  end

  def test_with_options
    expected = {"exists" => { "field" => "color", "null_value" => "_null" }}

    assert_equal expected, Arelastic::Queries::Exists.new('color', 'null_value' => "_null").as_elastic
  end
end