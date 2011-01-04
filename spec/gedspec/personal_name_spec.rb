require 'spec_helper'

describe Gedspec::PersonalName do
  before do
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
  
  it 'parses name' do
    @name.name.should == 'John "Jack" de /Hancock/ Jr.'
  end
  
  it 'parses npfx' do
    @name.npfx.should == 'Lt.'
  end
  
  it 'parses givn' do
    @name.givn.should == 'John'
  end
  
  it 'parses nick' do
    @name.nick.should == 'Jack'
  end
  
  it 'parses spfx' do
    @name.spfx.should == 'de'
  end
  
  it 'parses surname' do
    @name.surn.should == 'Hancock'
  end
  
  it 'parses nsfx' do
    @name.nsfx.should == 'Jr.'
  end
end