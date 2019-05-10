require 'helper'

class Arelastic::Queries::NestedTest < Minitest::Test
  def test_as_elastic
  end

  def test_negate
    match_query  = Arelastic::Queries::Match.new('color', 'green')
    nested_query = Arelastic::Queries::Nested.new('dogs', match_query)

     expected = {
       'nested' => {
         'path' => 'dogs',
         'query' => {
           'bool' => {
             'must_not' => {
               'match' => {
                 'color' => 'green'
                }
              }
            }
          }
        }
      }

     assert_equal expected, nested_query.negate.as_elastic
  end
end
