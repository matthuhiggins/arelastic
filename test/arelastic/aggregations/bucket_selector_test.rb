require 'helper'

class Arelastic::Aggregations::BucketSelectorTest < Minitest::Test
  def test_as_elastic
    aggregation = Arelastic::Aggregations::BucketSelector.new('foo_agg',
      script_params: {
        'foo_bucket' => 'foo_bucket_path',
        'bar_bucket' => 'bar_bucket_path'
      },
      script: "params.foo_bucket > 10 && params.bar_bucket < 100"
    )
    expected = {
      'foo_agg' => {
        'bucket_selector' => {
          'buckets_path' => {
            'foo_bucket' => 'foo_bucket_path',
            'bar_bucket' => 'bar_bucket_path'
          },
          'script' => 'params.foo_bucket > 10 && params.bar_bucket < 100'
        }
      }
    }
    assert_equal expected, aggregation.as_elastic
  end
end
