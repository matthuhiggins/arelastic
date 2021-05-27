require "helper"

class Arelastic::Aggregations::BucketSortTest < Minitest::Test
  def test_as_elastic
    aggregation = Arelastic::Aggregations::BucketSort.new("foo_agg", "size" => 3, "from" => 5, "sort" => "price")

    expected = {
      "foo_agg" => {
        "bucket_sort" => {
          "sort" => "price",
          "from" => 5,
          "size" => 3
        }
      }
    }
    assert_equal expected, aggregation.as_elastic
  end

  def test_arelastic_sort
    sort = Arelastic::Sorts::Field.new("price" => "desc")
    aggregation = Arelastic::Aggregations::BucketSort.new("foo_agg", "sort" => sort)

    expected = {
      "foo_agg" => {
        "bucket_sort" => {
          "sort" => {"price" => "desc"}
        }
      }
    }
    assert_equal expected, aggregation.as_elastic
  end

  def test_optional_sort
    aggregation = Arelastic::Aggregations::BucketSort.new("foo_agg", "size" => 3)

    expected = {
      "foo_agg" => {
        "bucket_sort" => {
          "size" => 3
        }
      }
    }
    assert_equal expected, aggregation.as_elastic
  end
end
