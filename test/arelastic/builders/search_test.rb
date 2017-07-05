require 'helper'

class Arelastic::Builders::SearchTest < Minitest::Test
  def test_filter
    assert_equal Arelastic::Builders::Filter, Arelastic::Builders::Search.filter
  end

  def test_field
    assert_kind_of Arelastic::Builders::Filter, Arelastic::Builders::Search['poop']
  end

  def test_aggregation
    assert_equal Arelastic::Builders::Aggregation, Arelastic::Builders::Search.aggregation
  end

  def test_query
    assert_equal Arelastic::Builders::Query, Arelastic::Builders::Search.query
  end

  def test_sort
    assert_equal Arelastic::Builders::Sort, Arelastic::Builders::Search.sort
  end
end
