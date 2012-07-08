require 'helper'

class Arelastic::Builders::FilterTest < MiniTest::Spec
  def test_eq
    expected = {"term"=>{"color"=>"blue"}}
    assert_equal expected, builder.eq('blue').as_elastic
  end

  def test_not_eq
    expected = {"not" => {"term" => {"color"=>"blue"}}}
    assert_equal expected, builder.not_eq('blue').as_elastic
  end

  def test_in
    expected = {"terms" => {"color"=>["blue"]}}
    assert_equal expected, builder.in(['blue']).as_elastic
  end

  def test_not_in
    expected = {"not" => {"terms" => {"color"=>["blue"]}}}
    assert_equal expected, builder.not_in(['blue']).as_elastic
  end

  def test_prefix
    expected = {"prefix"=>{"color"=>"blu"}}
    assert_equal expected, builder.prefix('blu').as_elastic
  end

  def test_exists
    expected = {"exists"=>{"field"=>"color"}}
    assert_equal expected, builder.exists.as_elastic
  end

  def test_range
    expected = {"range" => {"color" => {"lt" => 5}}}
    assert_equal expected, builder.lt(5).as_elastic
  end

  private
    def builder
      @builder ||= Arelastic::Builders::Filter['color']
    end
end
