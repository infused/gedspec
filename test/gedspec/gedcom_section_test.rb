require 'test_helper'

class Gedspec::GedcomSectionTest < Test::Unit::TestCase
  def setup
    @section = Gedspec::GedcomSection.new(fixture_content('/tcg551_i13.ged'))
    @section.class.send(:attr_accessor, :start_callbacks)
    @section.class.send(:attr_accessor, :end_callbacks)
  end
  
  should 'load' do
    assert_kind_of Gedspec::GedcomSection, @section
  end
  
  context '#get_level' do
    should 'grab the first number from the string' do
      assert_equal 0, @section.get_level('0 @I1@ INDI')
    end
    
    should 'be nil if the the string does not start with a number' do
      assert @section.get_level('INDI').nil?
    end
  end
  
  context '#tag_start' do
    should 'register a callback in @start_callbacks' do
      @section.tag_start 'INDI', :create_individual, :a => 1, :b => 2
      assert_equal({"indi" => [:create_individual, {:a => 1, :b => 2}]}, @section.start_callbacks)
    end
  end
  
  context '#tag_end' do
    should 'register a callback in @end_callbacks' do
      @section.tag_end 'INDI', :update_individual, :a => 1, :b => 2
      assert_equal({"indi" => [:update_individual, {:a => 1, :b => 2}]}, @section.end_callbacks)
    end
  end
  
  context '#parse' do
    should 'call "tag start" callbacks' do
      @section.tag_start 'INDI', :start_indi, {:a => 1, :b => 2}
      
      @section.expects(:start_indi).with('@I1@', {:a => 1, :b => 2})
      @section.parse('0 @I1@ INDI')
    end
    
    should 'call "tag end" callbacks' do
      @section.tag_end 'INDI', :end_indi, {:a => 1, :b => 2}
      
      @section.expects(:end_indi).with('@I1@', {:a => 1, :b => 2})
      @section.parse("0 @I1@ INDI\n1 NAME JOHN DOE\n0 TRLR")
    end
  end
end