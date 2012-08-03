require 'helper'

class Arelastic::Builders::FilterTest < MiniTest::Spec
  def test_ids
    expected = {"ids" => {"values"=>["5", "6"]}}
    assert_equal expected, Arelastic::Builders::Filter.ids('5', '6').as_elastic
  end

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

  def test_in_with_range
    expected = {"range" => {"color" => {"gte"=>1, "lte"=>3}}}
    assert_equal expected, builder.in(1..3).as_elastic

    expected = {"range" => {"color" => {"gte"=>1, "lt"=>3}}}
    assert_equal expected, builder.in(1...3).as_elastic
  end

  def test_not_in
    expected = {"not" => {"terms" => {"color"=>["blue"]}}}
    assert_equal expected, builder.not_in(['blue']).as_elastic
  end

  def test_prefix
    expected = {"prefix" => {"color" => "blu"}}
    assert_equal expected, builder.prefix('blu').as_elastic
  end

  def test_exists
    expected = {"exists" => {"field" => "color"}}
    assert_equal expected, builder.exists.as_elastic
  end

  def test_range
    expected = {"range" => {"color" => {"lt" => 5}}}
    assert_equal expected, builder.lt(5).as_elastic
  end

  def test_distance
    expected = {"geo_distance" => {"distance" => "10km", "color" => [10, 11]}}
    assert_equal expected, builder.distance([10, 11], '10km').as_elastic

    expected = {"geo_distance" => {"distance" => "10km", "color" => [10, 11], "distance_type" => "plane"}}
    assert_equal expected, builder.distance([10, 11], '10km', 'distance_type' => 'plane').as_elastic
  end

  private
    def builder
      @builder ||= Arelastic::Builders::Filter['color']
    end
end
