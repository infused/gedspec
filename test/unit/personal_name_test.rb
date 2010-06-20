require File.join(File.dirname(__FILE__), '..', 'test_helper')

class Gedspec::PersonalNameTest < Test::Unit::TestCase
  def setup
    @name = Gedspec::PersonalName.parse <<-END
      1 NAME John "Jack" de /Hancock/ Jr.
      2 NPFX Lt.
      2 GIVN John
      2 NICK Jack
      2 SPFX de
      2 SURN Hancock
      2 NSFX Jr.
    END
  end
  
  should 'parse name' do
    assert_equal 'John "Jack" de /Hancock/ Jr.', @name.name
  end
  
  should 'parse npfx' do
    assert_equal 'Lt.', @name.npfx
  end
  
  should 'parse givn' do
    assert_equal 'John', @name.givn
  end
  
  should 'parse nick' do
    assert_equal 'Jack', @name.nick
  end
  
  should 'parse spfx' do
    assert_equal 'de', @name.spfx
  end
  
  should 'parse surname' do
    assert_equal 'Hancock', @name.surn
  end
  
  should 'parse nsfx' do
    assert_equal 'Jr.', @name.nsfx
  end
end