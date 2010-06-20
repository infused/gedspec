require 'test_helper'

module Gedspec
  class GedcomSection < Gedspec::Gedcom::Structure
    
  end
end

class Gedspec::GedcomStructureTest < Test::Unit::TestCase
  should 'load' do
    @section = Gedspec::GedcomSection.new
    assert_kind_of Gedspec::GedcomSection, @section
  end
  
  context '#get_level' do
    should 'grab the first number from the string' do
      @section = Gedspec::GedcomSection.new
      assert_equal 0, @section.get_level('0 @I1@ INDI')
    end
    
    should 'be nil if the the string does not start with a number' do
      @section = Gedspec::GedcomSection.new
      assert @section.get_level('INDI').nil?
    end
  end
  
  context '#parse' do
    should 'call "tag start" callbacks' do
      @section = Gedspec::GedcomSection.new('0 @I1@ INDI')
      
      @section.expects(:update_attr).with('@I1@', {:attr => :xref})
      @section.parse
    end
    
    should 'call "tag end" callbacks'
  end
end