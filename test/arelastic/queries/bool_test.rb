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
  #   expected = {"filtered" => {"query" => {"query_string" => {"query" => "bar"}}}}
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
      'boost' => 1.0
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

  def test_merging_terms

    expected = {
      "bool" => {
        "must"=> [
          {
            "nested" => {
              "path" => "friends",
              "query"=> { "match" => { "friends.age" => { "query" => "101" } } },
              "inner_hits" => {}
            }
          },
          {
            "nested" => {
              "path" => "friends",
              "query" => {
                "bool" => {
                  "must"=> [
                    { "match" => { "friends.first_name" => { "query" => "Thomas" } } },
                    { "match" => { "friends.last_name" => { "query" => "Jefferson" } } }
                  ]
                }
              }
            }
          }
        ],
        "should" => [
          {
            "has_parent" => {
              "parent_type" => "user",
              "query" => {
                "bool" => {
                  "should" => [
                    { "query_string1" => "Texas" },
                    { "query_string2" => "Delaware" }
                  ]
                }
              }
            }
          },
          {
            "has_parent" => {
              "parent_type" => "president",
              "query" => { "query_string3" => "Washington" }
            }
          }
        ]
      }
    }

    should = [
      Arelastic::Queries::HasParent.new("user",      { "query_string1" => "Texas"      }),
      Arelastic::Queries::HasParent.new("user",      { "query_string2" => "Delaware"   }),
      Arelastic::Queries::HasParent.new("president", { "query_string3" => "Washington" })
    ]
    must = [
      Arelastic::Queries::Nested.new("friends", {"match" => { "friends.age"        => { "query" => "101"       }}}, 'inner_hits' => {}),
      Arelastic::Queries::Nested.new("friends", {"match" => { "friends.first_name" => { "query" => "Thomas"    }}}),
      Arelastic::Queries::Nested.new("friends", {"match" => { "friends.last_name"  => { "query" => "Jefferson" }}})
    ]
    assert_equal expected, Arelastic::Queries::Bool.new(should: should, must: must).as_elastic
  end
end
