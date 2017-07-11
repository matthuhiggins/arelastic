require 'helper'

class Arelastic::Queries::ExistsTest < Minitest::Test
  def test_setting_value_as_regexp_object
    assert_raises TypeError do
      Arelastic::Queries::Regexp.new('color', /yellow(-green)?/)
    end
  end

  def test_string_value
    expected = { 'regexp' => { 'color' => 'blue(-green)?' } }

    assert_equal expected, Arelastic::Queries::Regexp.new('color', 'blue(-green)?').as_elastic
  end
end
