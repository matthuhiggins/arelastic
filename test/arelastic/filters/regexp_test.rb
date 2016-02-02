require 'helper'

class Arelastic::Filters::ExistsTest < Minitest::Test
  def test_regex_value_as_elastic
    assert_raises TypeError do
      Arelastic::Filters::Regexp.new('color', /yellow(-green)?/).as_elastic
    end
  end

  def test_string_value_as_elastic
    expected = { 'regexp' => { 'color' => 'blue(-green)?' } }

    assert_equal expected, Arelastic::Filters::Regexp.new('color', 'blue(-green)?').as_elastic
  end
end
