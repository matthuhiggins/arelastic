require 'helper'

class Arelastic::ScopeTest < MiniTest::Spec
  def test_filter
    scope = Arelastic::Scope.new
    scope.filter!('foo' => 'bar')
    scope.filter!(scope.search['faz'].in ['baz', 'fum'])
    
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

    assert_equal expected, scope.as_elastic
  end

  def test_query
    scope = Arelastic::Scope.new
    scope.query!('foo')

    expected = {
      "query" => {"query_string"=>"foo"}
    }

    assert_equal expected, scope.as_elastic
  end

  def test_filter_and_query
    scope = Arelastic::Scope.new
    scope.query!('field' => {'name' => 'joe'})
    scope.filter!(scope.search['name'].prefix "mat")

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

    assert_equal expected, scope.as_elastic
  end

  def test_facet
    scope = Arelastic::Scope.new
    scope.facet!(scope.search.facet('popular_tags').terms('tags'))

    expected = {
      "facets" => {
        "popular_tags" => {
          "terms" => {
            "field"=>"tags"
          }
        }
      }
    }

    assert_equal expected, scope.as_elastic
  end
end