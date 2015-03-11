require 'helper'

class Arelastic::Filters::ScriptTest < Minitest::Test
  def test_as_elastic
    expected = {"script" => {"script" => "doc['color'].value.charAt(0) == 'r'"}}

    assert_equal expected, Arelastic::Filters::Script.new("doc['color'].value.charAt(0) == 'r'").as_elastic
  end

  def test_with_options
    expected = {"script" => {"script" => "doc['color'].value.length() == length", "params" => {"length" => 3}}}

    assert_equal expected, Arelastic::Filters::Script.new("doc['color'].value.length() == length", 'params' => {"length" => 3}).as_elastic
  end
end