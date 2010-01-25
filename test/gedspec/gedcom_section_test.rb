require 'test_helper'

class Gedspec::GedcomSectionTest < Test::Unit::TestCase
  def setup
    @section = Gedspec::GedcomSection.new(fixture_content('/tcg551_i13.ged'))
  end
  
  should 'load' do
    assert_kind_of Gedspec::GedcomSection, @section
  end
  
  context '#get_level' do
    should 'grab the first number from the string' do
      assert_equal '0', @section.get_level('0 @I1@ INDI')
    end
    
    should 'be nil if the the string does not start with a number' do
      assert @section.get_level('INDI').nil?
    end
  end
end