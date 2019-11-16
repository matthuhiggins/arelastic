require 'helper'

class Arelastic::Builders::QueriesTest < Minitest::Test
  def test_constant_score
    query = Arelastic::Builders::Queries.constant_score({"foo" => "bar"})
    expected = {"constant_score" => {"foo" => "bar"}}

    assert_equal expected, query.as_elastic
  end

  def test_bool
    query = Arelastic::Builders::Queries.bool(
      must: {"query_string" => "foo"},
      filter: {"term" => "bar"}
    )
    expected = {"bool" => {"must" => {"query_string" => "foo"}, "filter" => {"term" => "bar"}}}

    assert_equal expected, query.as_elastic
  end

  def test_match_all
    query = Arelastic::Builders::Queries.match_all
    expected = {"match_all" => {}}

    assert_equal expected, query.as_elastic
  end

  def test_ids
    expected = {"ids" => {"values"=>["5", "6"]}}
    assert_equal expected, Arelastic::Builders::Queries.ids(['5', '6']).as_elastic
  end

  def test_multi_match
    Arelastic::Builders::Queries.multi_match 'blue', ['color', 'description']
  end

  def test_field
    query = Arelastic::Builders::Queries['user'].field 'kimchy'
    expected = { "field" => { "user" => "kimchy" } }

    assert_equal expected, query.as_elastic
  end

  def test_term
    query = Arelastic::Builders::Queries['user'].term 'kimchy'
    expected = {"term" => { "user" => "kimchy" }}

    assert_equal expected, query.as_elastic
  end

  def test_terms
    query = Arelastic::Builders::Queries['tags'].terms ['blue', 'pill']
    expected = {"terms" => { "tags" => ["blue", "pill"] }}

    assert_equal expected, query.as_elastic
  end

  def test_match
    query = Arelastic::Builders::Queries['message'].match "hello"
    expected = {"match" => { "message" => "hello" }}

    assert_equal expected, query.as_elastic
  end
end
