require 'helper'

class Arelastic::Aggregations::ReverseNestedTest < Minitest::Test
  def test_as_elastic
    aggregation = Arelastic::Aggregations::ReverseNested.new(
      'smallest',
      'pets',
      [Arelastic::Aggregations::Min.new('smallest', 'field' => 'pets.weight')]
    )

    expected = {
      "smallest" => {
        "reverse_nested" => {
          "path" => "pets"
        },
        "aggs" => {
          "smallest" => {
            "min" => { "field" => "pets.weight" }
          }
        }
      }
    }
    assert_equal expected, aggregation.as_elastic
  end

  def test_as_elastic_without_path
    aggregation = Arelastic::Aggregations::ReverseNested.new(
      'youngest',
      [Arelastic::Aggregations::Min.new('youngest', 'field' => 'age')]
    )

    expected = {
      "youngest" => {
        "reverse_nested" => {},
        "aggs" => {
          "youngest" => {
            "min" => { "field" => "age" }
          }
        }
      }
    }
    assert_equal expected, aggregation.as_elastic
  end
end
