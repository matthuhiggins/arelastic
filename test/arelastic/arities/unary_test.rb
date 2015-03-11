require 'helper'

class Arelastic::Arities::UnaryTest < Minitest::Test
  def test_unary
    node = Class.new(Arelastic::Nodes::Node) do
      unary 'unicorn'
    end

    expected = {'unicorn' => 'serenity'}
    assert_equal expected, node.new('serenity').as_elastic
  end
end