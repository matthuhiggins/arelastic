require 'helper'

class Arelastic::FieldTest < MiniTest::Spec
  def test_eq
    expected = {"term"=>{"color"=>"blue"}}
    assert_equal expected, field.eq('blue').as_elastic
  end

  def test_not_eq
    expected = {"not" => {"term" => {"color"=>"blue"}}}
    assert_equal expected, field.not_eq('blue').as_elastic
  end

  def test_in
    expected = {"terms" => {"color"=>["blue"]}}
    assert_equal expected, field.in(['blue']).as_elastic
  end

  def test_prefix
    expected = {"prefix"=>{"color"=>"blu"}}
    assert_equal expected, field.prefix('blu').as_elastic
  end

  def exists
    
  end

  private
    def field
      @field ||= Arelastic::Field.new('color')
    end
end