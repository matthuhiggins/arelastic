require 'helper'

class Arelastic::Queries::BoolTest < Minitest::Test
  # def test_as_elastic
  #   filtered = Arelastic::Queries::Filtered.new(
  #     query: {"query_string" => "bar"},
  #     filter: {"term" => "baz"}
  #   )
  #   expected = {"filtered" => {"query" => {"query_string" => "bar"}, "filter" => {"term" => "baz"}}}
  #
  #   assert_equal expected, filtered.as_elastic
  # end
  #
  # def test_as_elastic_with_query_node
  #   filtered = Arelastic::Queries::Filtered.new(query: Arelastic::Queries::QueryString.new("bar"))
  #   expected = {"filtered" => {"query" => {"query_string" => {"query"=>"bar"}}}}
  #
  #   assert_equal expected, filtered.as_elastic
  # end

  def test_as_elastic
    bool = Arelastic::Queries::Bool.new(
      must: {
        'prefix' => {
          'user' => 'kimchy'
        }
      },
      must_not: Arelastic::Queries::Match.new('color', 'green'),
      should: [
        Arelastic::Queries::Match.new('height', 6)
      ],
      boost: 1.0
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
        ],
        'boost' => 1.0
      }
    }

    assert_equal expected, bool.as_elastic
  end
end
