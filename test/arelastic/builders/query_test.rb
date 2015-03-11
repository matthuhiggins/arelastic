require 'helper'

class Arelastic::Builders::QueryTest < Minitest::Test
  def test_constant_score
    query = Arelastic::Builders::Query.constant_score({"foo" => "bar"})
    expected = {"query" => {"constant_score" => {"foo" => "bar"}}}

    assert_equal expected, query.as_elastic
  end

  def test_filtered
    query = Arelastic::Builders::Query.filtered(
      query: {"query_string" => "foo"},
      filter: {"term" => "bar"}
    )
    expected = {"query" => {"filtered" => {"query" => {"query_string" => "foo"}, "filter" => {"term" => "bar"}}}}

    assert_equal expected, query.as_elastic
  end

  def test_match_all
    query = Arelastic::Builders::Query.match_all
    expected = {"query" => {"match_all" => {}}}

    assert_equal expected, query.as_elastic
  end

  def test_multi_match
    Arelastic::Builders::Query.multi_match 'blue', ['color', 'description']
  end

  def test_field
    query = Arelastic::Builders::Query['user'].field 'kimchy'
    expected = { "field" => { "user" => "kimchy" } }

    assert_equal expected, query.as_elastic
  end

  def test_term
    query = Arelastic::Builders::Query['user'].term 'kimchy'
    expected = {"term" => { "user" => "kimchy" }}

    assert_equal expected, query.as_elastic
  end

  def test_terms
    query = Arelastic::Builders::Query['tags'].terms ['blue', 'pill']
    expected = {"terms" => { "tags" => ["blue", "pill"] }}

    assert_equal expected, query.as_elastic
  end

  def test_match
    query = Arelastic::Builders::Query['message'].match "hello"
    expected = {"match" => { "message" => "hello" }}

    assert_equal expected, query.as_elastic
  end
end
