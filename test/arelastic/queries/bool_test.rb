require 'helper'

class Arelastic::Queries::BoolTest < MiniTest::Unit::TestCase
  def test_as_elastic
    bool = Arelastic::Queries::Bool.new(
      'must' => {
        'prefix' => {
          'user' => 'kimchy'
        }
      },
      'must_not' => Arelastic::Queries::Match.new('color', 'green'),
      'should' => [
        Arelastic::Queries::Match.new('height', 6)
      ]
    )

    expected = {
      'bool' => {
        'must' => {
          'prefix' => {
            'user' => 'kimchy'
          }
        },
        'must_not' => {
          'match' => {
            'color'=>'green'
          }
        },
        'should' => [
          'match' => {
            'height' => 6
          }
        ]
      }
    }

    assert_equal expected, bool.as_elastic
  end
end