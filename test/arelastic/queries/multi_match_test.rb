require 'helper'

class Arelastic::Queries::MultiMatchTest < MiniTest::Unit::TestCase
  def test_as_elastic
    query = "bar"
    fields = ["field_1", "field_2"]
    multi_match = Arelastic::Queries::MultiMatch.new(query, fields)
    expected = {
      "multi_match" => {
        "query" => "bar",
        "fields" => ["field_1", "field_2"]
      }
    }
    assert_equal expected, multi_match.as_elastic
  end

  def test_as_elastic_with_options
    query = "bar"
    fields = []
    options = {
      "use_dis_max" => false,
      "tie_breaker" => 0.5
    }
    multi_match = Arelastic::Queries::MultiMatch.new(query, fields, options)
    expected = {
      "multi_match" => {
        "query" => "bar",
        "fields" => [],
        "use_dis_max" => false,
        "tie_breaker" => 0.5
      }
    }
    assert_equal expected, multi_match.as_elastic
  end
end
