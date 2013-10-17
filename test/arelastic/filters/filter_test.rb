require 'helper'

class Arelastic::FilterTest < MiniTest::Unit::TestCase
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

  def test_negate
    filter = Arelastic::Filters::Term.new 'foo', 'bar'

    negated_filter = filter.negate

    assert negated_filter.is_a?(Arelastic::Filters::Not)
    assert_equal filter, negated_filter.expr
  end

  def test_nested
    filter = Arelastic::Filters::Term.new('foo', 'bar').nested('links')

    nested_filter = filter.nested 'links'

    assert nested_filter.is_a?(Arelastic::Filters::Nested)
    assert_equal filter, nested_filter.expr
  end
end
