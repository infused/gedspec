require 'test_helper'

class Gedspec::GedcomStructureTest < Test::Unit::TestCase
  should 'load' do
    @structure = Gedspec::Gedcom::Structure.new
    assert_kind_of Gedspec::Gedcom::Structure, @structure
  end
  
  context '#get_level' do
    should 'grab the first number from the string' do
      @structure = Gedspec::Gedcom::Structure.new
      assert_equal 0, @structure.get_level('0 @I1@ INDI')
    end
    
    should 'be nil if the the string does not start with a number' do
      @structure = Gedspec::Gedcom::Structure.new
      assert @structure.get_level('INDI').nil?
    end
  end

end