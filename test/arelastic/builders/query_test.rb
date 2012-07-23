require 'helper'

class Arelastic::Builders::QueryTest < MiniTest::Spec
  def test_constant_score
    query = Arelastic::Builders::Query.constant_score({"foo" => "bar"})
    expected = {"query" => {"constant_score" => {"foo" => "bar"}}}

    assert_equal expected, query.as_elastic
  end

  def test_filtered
    query = Arelastic::Builders::Query.filtered({"query" => "foo"}, {"filter" => "bar"})
    expected = {"query" => {"filtered" => {"query" => "foo", "filter" => "bar"}}}

    assert_equal expected, query.as_elastic
  end

  def test_match_all
    query = Arelastic::Builders::Query.match_all
    expected = {"query" => {"match_all" => {}}}

    assert_equal expected, query.as_elastic
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

  def test_term
    query = Arelastic::Builders::Query['tags'].terms ['blue', 'pill']
    expected = {"terms" => { "tags" => ["blue", "pill"] }}
    
    assert_equal expected, query.as_elastic
  end
end