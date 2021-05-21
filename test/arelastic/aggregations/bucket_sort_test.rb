require 'helper'

class Arelastic::Aggregations::BucketSortTest < Minitest::Test
  def test_parse_sort
    assert_equal ['foo'], parse_sort('foo')
    assert_equal [{'foo' => 'desc'}], parse_sort({'foo' => 'desc'})
    assert_equal [{'foo' => { 'order' => 'desc' }}, 'bar'], parse_sort([{'foo' => { 'order' => 'desc'}}, 'bar'])
  end

  def test_size_and_from
    aggregation = Arelastic::Aggregations::BucketSort.new('foo_agg', 'size' => 3, 'from' => 5)
    expected = {
      'foo_agg' => {
        'bucket_sort' => {
          'from' => 5,
          'size' => 3
        }
      }
    }
    assert_equal expected, aggregation.as_elastic
  end

  def parse_sort(sort)
    Arelastic::Aggregations::BucketSort.new('foosort', sort: sort).parse_sort
  end
end
