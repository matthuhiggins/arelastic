require 'helper'

class Arelastic::Mappings::MultiFieldTest < MiniTest::Unit::TestCase
  def test_as_elastic
    type = Arelastic::Mappings::MultiField.new('message', 'message' => {'type' => 'string', 'index' => 'analyzed'}, 'untouched' => {'type' => 'string', 'index' => 'not_analyzed'})
    expected = {
      'message' => {
        'type'    => 'multi_field',
        'fields'  => {
          'message'   => {'type' => 'string', 'index' => 'analyzed'},
          'untouched' => {'type' => 'string', 'index' => 'not_analyzed'}
        }
      }
    }

    assert_equal expected, type.as_elastic
  end
end