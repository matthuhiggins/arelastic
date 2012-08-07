require 'helper'

class Arelastic::Arities::BinaryTest < MiniTest::Spec
  def test_binary
    node = Class.new(Arelastic::Nodes::Node) do
      binary 'suffix'
    end

    expected = {'suffix' => {'phone' => '666'}}
    assert_equal expected, node.new('phone', '666').as_elastic

    expected = {'suffix' => {'phone' => '666', '_cache' => false}}
    assert_equal expected, node.new('phone', '666', '_cache' => false).as_elastic
  end
end