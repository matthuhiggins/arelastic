require 'helper'

class Arelastic::Queries::MatchAllTest < Minitest::Test
  def test_as_elastic
    match_all = Arelastic::Queries::MatchAll.new
    expected = {"match_all" => {}}

    assert_equal expected, match_all.as_elastic
  end

  def test_merging_match_all_terms
    expected = { "bool" => { "should" => [{
      "match_all" => {}
    }]}}

    term1 = Arelastic::Queries::MatchAll.new
    term2 = Arelastic::Queries::MatchAll.new
    assert_equal expected, Arelastic::Queries::Bool.new(should: [term1, term2]).as_elastic
  end

end
