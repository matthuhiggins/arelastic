require 'helper'

class Arelastic::Sorts::SortTest < MiniTest::Spec
  def test_as_elastic
    assert_equal(
      'price',
      Arelastic::Sorts::Sort.new('price').as_elastic,
    )

    assert_equal(
      {'price' => 'asc'},
      Arelastic::Sorts::Sort.new('price' => 'asc').as_elastic
    )

    assert_equal(
      {'price' => {'order' => 'asc'}},
      Arelastic::Sorts::Sort.new('price', 'order' => 'asc').as_elastic
    )

    assert_equal(
      {'price' => {'order' => 'asc', 'missing' => '_last'}},
      Arelastic::Sorts::Sort.new({'price' => 'asc'}, {'missing' => '_last'}).as_elastic
    )
  end

  def test_reverse
    assert_equal(
      {'price' => 'desc'},
      Arelastic::Sorts::Sort.new('price').reverse.as_elastic,
    )

    assert_equal(
      {'price' => 'desc'},
      Arelastic::Sorts::Sort.new('price' => 'asc').reverse.as_elastic
    )

    assert_equal(
      {'price' => 'asc'},
      Arelastic::Sorts::Sort.new('price' => 'desc').reverse.as_elastic
    )

    assert_equal(
      {'price' => {'order' => 'asc', 'missing' => '_last'}},
      Arelastic::Sorts::Sort.new({'price' => 'desc'}, {'missing' => '_last'}).reverse.as_elastic
    )
  end
end