require 'helper'

class Arelastic::Nodes::NodeTest < Minitest::Test
  def test_equality
    node = Class.new(Arelastic::Nodes::Node) do
      def initialize(value)
        @value = value
      end

      def as_elastic
        {"value" => @value}
      end
    end

    assert_equal node.new('foo'), node.new('foo')
    refute_equal node.new('foo'), node.new('bar')
    refute_equal node.new('foo'), 'wut'
  end
end