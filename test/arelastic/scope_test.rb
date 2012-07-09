require 'helper'

class Arelastic::ScopeTest < MiniTest::Spec
  def test_query_with_no_queries
    expected = {"match_all" => {}}

    assert_equal expected, scope.as_elastic['query']
  end

  def test_query_with_only_filters
    scope.filter!('foo' => 'bar')
    scope.filter!(scope.search['faz'].in ['baz', 'fum'])
    
    expected = {
      "constant_score" => {
        "filter" => {
          "and" => [
            {"term"   => {"foo" => "bar"}},
            {"terms"  => {"faz" => ["baz", "fum"]}}
          ]
        }
      }
    }

    assert_equal expected, scope.as_elastic['query']
  end

  def test_query_with_only_query
    scope.query!('foo')

    expected = {"query_string"=>"foo"}

    assert_equal expected, scope.as_elastic['query']
  end

  def test_query_with_both_filter_and_query
    scope.query!('field' => {'name' => 'joe'})
    scope.filter!(scope.search['name'].prefix "mat")

    expected = {
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

    assert_equal expected, scope.as_elastic['query']
  end

  def test_facet
    scope.facet!(scope.search.facet['popular_tags'].terms('tags'))

    expected = {
      "popular_tags" => {
        "terms" => {
          "field"=>"tags"
        }
      }
    }

    assert_equal expected, scope.as_elastic['facets']
  end

  def test_limit
    scope.limit!(5)

    expected = 5
    assert_equal expected, scope.as_elastic['size']
  end

  def test_offset
    scope.offset!(42)

    expected = 42
    assert_equal expected, scope.as_elastic['from']
  end

  def test_sort
    scope.sort! 'foo'
    scope.sort! 'bar' => 'desc'

    expected = [
      'foo',
      'bar' => 'desc'
    ]

    assert_equal expected, scope.as_elastic['sort']
  end

  private
    def scope
      @scope ||= Arelastic::Scope.new
    end
end