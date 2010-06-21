require File.join(File.dirname(__FILE__), '..', 'test_helper')

class Gedspec::ReferenceNumberTest < Test::Unit::TestCase
  def setup
    @refn = Gedspec::ReferenceNumber.parse <<-END
      1 REFN T13
      2 TYPE TurboGed
    END
  end
  
  should 'parse refn' do
    assert_equal 'T13', @refn.refn
  end
  
  should 'parse type' do
    assert_equal 'TurboGed', @refn.type
  end
end