require 'helper'

class Arelastic::Aggregations::TermsTest < Minitest::Test
  def test_as_elastic
    aggregation = Arelastic::Aggregations::Terms.new('foo', 'field' => 'tags', 'size' => 10)
    expected = {
      "foo" => {
        "terms" => {
          "field" => "tags",
          "size"  => 10,
        }
      }
    }

    assert_equal expected, aggregation.as_elastic
  end
end
