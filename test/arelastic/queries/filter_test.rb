require 'helper'

class Arelastic::Queries::FilterTest < Minitest::Test
  def test_as_elastic
    filter = Arelastic::Queries::Filter.new(
      Arelastic::Queries::Match.new('color', 'green'),
      'weight' => 23
    )

   expected = {
     'filter' => {
       'match' => {
         'color' => 'green'
       }
     },
     'weight' => 23
   }
    assert_equal expected, filter.as_elastic
  end
end
