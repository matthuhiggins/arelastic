require 'helper'

class Arelastic::RelatonTest < MiniTest::Spec
  def test_filter
    relation = Arelastic::Relation.new
    relation.filter!('foo' => 'bar')
    relation.filter!(relation.index[:faz].in ['baz', 'fum'])
    
    expected = {
      "query" => {
        "constant_score" => {
          "filter" => {
            "and" => [
              {"term"   => {"foo" => "bar"}},
              {"terms"  => {"faz" => ["baz", "fum"]}}
            ]
          }
        }
      }
    }

    assert_equal expected, relation.build_search.as_elastic
  end

  def test_filter_and_query
    relation = Arelastic::Relation.new
    relation.query!('field' => {'name' => 'joe'})
    relation.filter!(relation.index[:name].prefix "mat")

    expected = {
      "query" => {
        "filtered" => {
          "query" => {
            "field" => {
              "name"=>"joe"
            },
          },
          "filter" => {
            "prefix" => {
              "name" => "mat"
            }
          }
        }
      }
    }

    assert_equal expected, relation.build_search.as_elastic
  end
end