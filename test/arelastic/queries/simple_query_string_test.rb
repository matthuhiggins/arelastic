require 'helper'

class Arelastic::Queries::SimpleQueryStringTest < Minitest::Test
  def test_as_elastic
    simple_query_string = Arelastic::Queries::SimpleQueryString.new(["color", "name"], "bar")
    expected = {
      "simple_query_string" => {
        "fields" => ["color", "name"],
        "query" => "bar"
      }
    }
    assert_equal expected, simple_query_string.as_elastic
  end

  def test_as_elastic_with_options
    simple_query_string = Arelastic::Queries::SimpleQueryString.new(["color", "name"], "bar", "flags" => "OR")
    expected = {
      "simple_query_string" => {
        "fields" => ["color", "name"],
        "query" => "bar",
        "flags" => "OR"
      }
    }
    assert_equal expected, simple_query_string.as_elastic
  end
end
