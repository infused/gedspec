require 'test_helper'

module Gedspec
  class GedcomSection < Gedspec::Gedcom::StackParser
    
  end
end

class Gedspec::GedcomStackParserTest < Test::Unit::TestCase
  
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
  
  # context '#tag_start' do
  #   should 'register a callback in @start_callbacks' do
  #     @section = Gedspec::GedcomSection.new
  #     
  #     @section.tag_start 'INDI', :create_individual, :a => 1, :b => 2
  #     assert_equal({"indi" => [:create_individual, {:a => 1, :b => 2}]}, Gedspec::GedcomSection.start_callbacks)
  #   end
  # end
  # 
  # context '#tag_end' do
  #   should 'register a callback in @end_callbacks' do
  #     @section = Gedspec::GedcomSection.new
  #     
  #     @section.tag_end 'INDI', :update_individual, :a => 1, :b => 2
  #     assert_equal({"indi" => [:update_individual, {:a => 1, :b => 2}]}, Gedspec::GedcomSection.end_callbacks)
  #   end
  # end
  
  context '#parse' do
    should 'call "tag start" callbacks' do
      @section = Gedspec::GedcomSection.new('0 @I1@ INDI')
      @section.tag_start 'INDI', :start_indi, {:a => 1, :b => 2}
      
      @section.expects(:start_indi).with('@I1@', {:a => 1, :b => 2})
      @section.parse
    end
    
    should 'call "tag end" callbacks' do
      @section = Gedspec::GedcomSection.new("0 @I1@ INDI\n1 NAME JOHN DOE\n0 TRLR")
      @section.tag_end 'INDI', :end_indi, {:a => 1, :b => 2}
      
      @section.expects(:end_indi).with('@I1@', {:a => 1, :b => 2})
      @section.parse
    end
  end
end