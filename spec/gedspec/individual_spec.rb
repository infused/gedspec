require 'spec_helper'

describe Gedspec::Individual do
  before do
    @indi = Gedspec::Individual.new <<-END
      0 @I1@ INDI
      1 RESN locked
      1 SEX M
      1 RFN R55
      1 AFN AFN4
      1 REFN T13
      1 REFN L98
      1 RIN A1
      1 NAME John /Hancock/
    END
  end
  
  it 'has many names' do
    @indi.name.should == 'John /Hancock/'
  end
  
  it 'parses xref' do
    @indi.xref.should == '@I1@'
  end
  
  it 'parses resn' do
    @indi.resn.should == 'locked'
  end
  
  it 'parses sex' do
    @indi.sex.should == 'M'
  end
  
  it 'parses rfn' do
    @indi.rfn.should == 'R55'
  end
  
  it 'parses afn' do
    @indi.afn.should == 'AFN4'
  end
  
  it 'parses refn' do
    @indi.refn.should == ['T13', 'L98']
  end
  
  it 'parses rin' do
    @indi.rin.should == 'A1'
  end
  
  it 'parses name' do
    @indi.name.should == 'John /Hancock/'
  end
end