require 'helper'

class Arelastic::Queries::FunctionScoreTest < Minitest::Test
  def test_as_elastic
    function_score = Arelastic::Queries::FunctionScore.new(
      query: Arelastic::Queries::MatchAll.new,
      'functions' => [
        Arelastic::Queries::Filter.new(
          Arelastic::Queries::Match.new('color', 'green')
        )
      ],
      'boost' => 1.0
    )

    expected = {
      'function_score' => {
        'query' => { 'match_all' => {} },
        'functions' => [
          {
            'filter' => {
              'match' => {
                'color' => 'green'
              }
            }
          }
        ],
        'boost' => 1.0
      }
    }

    assert_equal expected, function_score.as_elastic
  end
end
