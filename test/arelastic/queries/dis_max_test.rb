require 'helper'

class Arelastic::Queries::DisMaxTest < Minitest::Test
  def test_as_elastic
    bool = Arelastic::Queries::DisMax.new(
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

    assert_equal expected, bool.as_elastic
  end
end