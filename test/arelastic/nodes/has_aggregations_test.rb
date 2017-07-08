require 'helper'

class Arelastic::Nodes::HasAggregationsTest < Minitest::Test
  def test_includes_aggs
    # sub_aggregation = Arelastic::Aggregations::Terms.new('name', 'field' => 'name', 'size' => 10)
    # aggregation = Arelastic::Aggregations::Terms.new('tags', 'field' => 'tags', 'size' => 10, aggs: [sub_aggregation])
    #
    # expected = {
    #   "tags" => {
    #     "terms" => {
    #       "field" => "tags",
    #       "size" => 10
    #     },
    #     "aggs" => {
    #       "name" => {
    #         "terms" => {
    #           "field" => "name",
    #           "size" => 10
    #         }
    #       }
    #     }
    #   }
    # }
    #
    # assert_equal expected, aggregation.as_elastic
  end
end
