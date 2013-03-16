require 'helper'

class Arelastic::Filters::ExistsTest < MiniTest::Unit::TestCase
  def test_as_elastic
    expected = {"exists" => { "field" => "color" }}

    assert_equal expected, Arelastic::Filters::Exists.new('color').as_elastic
  end
end