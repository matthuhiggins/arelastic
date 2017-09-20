require 'helper'

class Arelastic::Queries::DisMaxTest < Minitest::Test
  def test_as_elastic
    dis_max = Arelastic::Queries::DisMax.new(
      queries: [
        {'term' => {'user' => 'kimchy'}},
        Arelastic::Queries::Match.new('color', 'green')
      ]
    )

    expected = {
      'dis_max' => {
        'queries' => [
          {'term' => {'user'=>'kimchy'}},
          {'match' =>{ 'color'=>'green'}}
        ]
      }
    }

    assert_equal expected, dis_max.as_elastic
  end
end
