require 'helper'

class ArelasticTest < Minitest::Test
  def test_queries
    assert_equal Arelastic::Builders::Queries, Arelastic.queries
  end
end
