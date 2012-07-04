require 'helper'

class Arelastic::FilterTest < MiniTest::Spec
  def test_or
    filter = Arelastic::Filters::Filter.new

    and_filter = filter.and(filter)

    assert and_filter.is_a?(Arelastic::Filters::And)
    assert_equal [filter, filter], and_filter.children
  end

  def test_and
    filter = Arelastic::Filters::Filter.new

    and_filter = filter.or(filter)

    assert and_filter.is_a?(Arelastic::Filters::Or)
    assert_equal [filter, filter], and_filter.children
  end
end
