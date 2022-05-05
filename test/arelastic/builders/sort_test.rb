require 'helper'

class Arelastic::Builders::SortTest < Minitest::Test
  def test_asc
    query = Arelastic::Builders::Sort['field'].asc
    expected = { 'field' => 'asc' }

    assert_equal expected, query.as_elastic
  end

  def test_desc
    query = Arelastic::Builders::Sort['field'].desc
    expected = { 'field' => 'desc' }

    assert_equal expected, query.as_elastic
  end
end
