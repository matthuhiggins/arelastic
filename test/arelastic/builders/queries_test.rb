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

  def test_missing
    expected = {"bool" => {"must_not" => {"exists" => {"field" => "color"}}}}
    assert_equal expected, Arelastic::Builders::Queries['color'].missing.as_elastic
  end

  def test_in
    expected = {"terms" => {"color" => ["blue"]}}
    assert_equal expected, Arelastic::Builders::Queries['color'].in(['blue']).as_elastic
  end

  def test_in_with_options
    expected = {"terms" => {"color" => ["blue"], "execution" => "bool"}}
    assert_equal expected, Arelastic::Builders::Queries['color'].in(['blue'], "execution" => "bool").as_elastic
  end

  def test_in_with_range
    expected = {"range" => {"color" => {"gte" => 1, "lte" => 3}}}
    assert_equal expected, Arelastic::Builders::Queries['color'].in(1..3).as_elastic

    expected = {"range" => {"color" => {"gte" => 1, "lt" => 3}}}
    assert_equal expected, Arelastic::Builders::Queries['color'].in(1...3).as_elastic
  end
end
