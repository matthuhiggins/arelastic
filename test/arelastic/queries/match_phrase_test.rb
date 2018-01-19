require 'helper'

class Arelastic::Queries::MatchPhraseTest < Minitest::Test
  def test_as_elastic
    match_phrase = Arelastic::Queries::MatchPhrase.new('message', 'a test')

    expected = { "match_phrase" => { "message" => "a test" } }

    assert_equal expected, match_phrase.as_elastic
  end
end
