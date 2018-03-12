require 'helper'

class Arelastic::Aggregations::SamplerTest < Minitest::Test
  def test_as_elastic
    aggregation = Arelastic::Aggregations::Sampler.new('sample', 10, [
      Arelastic::Aggregations::Terms.new('colors', 'field' => 'color')
    ])

    expected = {
      'sample' => {
        'sampler' => {
          'shard_size' => 10
        },
        'aggs' => {
          'colors' => {
            'terms' => {
              'field' => 'color'
            }
          }
        }
      }
    }
    assert_equal expected, aggregation.as_elastic
  end
end
