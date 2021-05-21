require 'helper'

class Arelastic::Aggregations::BucketSortTest < Minitest::Test
  def test_as_elastic
    with_hash_sort = Arelastic::Aggregations::BucketSort.new('foo_agg', 'size' => 3, 'from' => 5, 'sort' => {
      'bar_bucket' => 'desc', 'baz_bucket' => 'asc', 'fiz_bucket' => { 'order' => 'asc' }
    })
    expected = {
      'foo_agg' => {
        'bucket_sort' => {
          'sort' => [
            { 'bar_bucket' => 'desc' },
            { 'baz_bucket' => 'asc' },
            { 'fiz_bucket' => {'order' => 'asc'} }
          ],
          'from' => 5,
          'size' => 3
        }
      }
    }
    assert_equal expected, with_hash_sort.as_elastic

    with_array_sort = Arelastic::Aggregations::BucketSort.new('foo_agg', 'sort' =>
      ['bar_bucket', {'baz_bucket' => 'desc'}, {'fiz_bucket' => {'order' => 'desc'}}]
    )
    expected = {
      'foo_agg' => {
        'bucket_sort' => {
          'sort' => [
            'bar_bucket',
            { 'baz_bucket' => 'desc' },
            { 'fiz_bucket' => {'order' => 'desc'} }
          ]

        }
      }
    }
    assert_equal expected, with_array_sort.as_elastic
  end
end
