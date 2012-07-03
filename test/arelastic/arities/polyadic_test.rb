require 'helper'

class Arelastic::Arities::PolyadicTest < MiniTest::Spec
  def test_polyadic
    expr = Struct.new(:as_elastic)
    node = Class.new(Arelastic::Nodes::Node) do
      polyadic 'xor'
    end

    expected = {'xor' => [{'a' => 'b'}, {'x' => 'y'}]}
    assert_equal expected, node.new([expr.new('a' => 'b'), expr.new('x' => 'y')]).as_elastic
  end
end