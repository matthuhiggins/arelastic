require 'helper'

class ArelasticTest < Minitest::Test
  def test_queries
    assert_equal Arelastic::Builders::Queries, Arelastic.queries
  end

  def test_lookup
    expected =  { "term" => {"color" => "blue" }}
    assert_equal expected, Arelastic.queries['color'].term('blue').as_elastic
  end
end
