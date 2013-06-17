require 'helper'

class Arelastic::Builders::SearchTest < MiniTest::Unit::TestCase
  def test_filter
    assert_equal Arelastic::Builders::Filter, Arelastic::Builders::Search.filter
  end

  def test_field
    assert_kind_of Arelastic::Builders::Filter, Arelastic::Builders::Search['poop']
  end

  def test_facet
    assert_equal Arelastic::Builders::Facet, Arelastic::Builders::Search.facet
  end

  def test_filter
    assert_equal Arelastic::Builders::Query, Arelastic::Builders::Search.query
  end

  def test_filter
    assert_equal Arelastic::Builders::Sort, Arelastic::Builders::Search.sort
  end
end