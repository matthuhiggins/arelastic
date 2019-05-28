require 'helper'

class Arelastic::Queries::NestedTest < Minitest::Test
  def test_as_elastic
    expected = {
      'nested' => {
        'path'  => 'comments',
        'query' => {
          'match' => {
            'author'=>'matt'
          }
        },
        'inner_hits' => {}
      }
    }

    query = Arelastic::Queries::Match.new('author', 'matt')
    assert_equal expected, Arelastic::Queries::Nested.new('comments', query, 'inner_hits' => {}).as_elastic
  end
end
