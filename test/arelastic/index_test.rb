require 'helper'

class Arelastic::IndexTest < MiniTest::Spec
  def test_field
    index = Arelastic::Index.new

    field = index[:joe]

    assert_equal 'joe', field.name
  end
end