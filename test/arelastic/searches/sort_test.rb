require 'helper'

class Arelastic::Searches::SortTest < MiniTest::Spec
  def test_as_elastic
    sort = Arelastic::Searches::Sort.new [
      Arelastic::Sorts::Field.new('price'),
      {'name' => 'asc'}
    ]
    expected = {'sort' => ['price', {'name' => 'asc'}]}

    assert_equal expected, sort.as_elastic
  end
end