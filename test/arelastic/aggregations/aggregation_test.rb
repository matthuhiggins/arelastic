require 'helper'

class Arelastic::Aggregations::AggregationTest < Minitest::Test
  def test_nested
    aggregation = Arelastic::Aggregations::Min.new('smallest', 'field' => 'pets.weight').nested('pets')

    expected = Arelastic::Aggregations::Nested.new('smallest', 'pets', [aggregation])
    assert_equal expected, aggregation.nested('pets')
  end

  def test_reverse_nested
    aggregation = Arelastic::Aggregations::Min.new('smallest', 'field' => 'pets.weight').reverse_nested('pets')

    expected = Arelastic::Aggregations::ReverseNested.new('smallest', 'pets', [aggregation])    
    assert_equal expected, aggregation.reverse_nested('pets')
  end
end
