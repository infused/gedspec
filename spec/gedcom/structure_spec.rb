require 'spec_helper'

describe Gedspec::Gedcom::Structure do
  describe '#get_level' do
    it 'grasb the first number from the string' do
      @structure = Gedspec::Gedcom::Structure.new
      @structure.get_level('0 @I1@ INDI').should == 0
    end
    
    it 'should be nil if the the string does not start with a number' do
      @structure = Gedspec::Gedcom::Structure.new
      @structure.get_level('INDI').should be_nil
    end
  end
end