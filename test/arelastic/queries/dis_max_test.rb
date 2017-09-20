require 'helper'

class Arelastic::Queries::DisMaxTest < Minitest::Test
  def test_as_elastic
    dis_max = Arelastic::Queries::DisMax.new(
      [Arelastic::Queries::Match.new('color', 'green')],
      'tie_breaker' => 0.7,
      'boost' => 1.2
    )

    expected = {
      'dis_max' => {
        'queries' => [
          {
            'match' => {
              'color' => 'green'
            }
          }
        ],
        'tie_breaker' => 0.7,
        'boost' => 1.2
      }
    }

    assert_equal expected, dis_max.as_elastic
  end
end
