require 'spec_helper'

describe Gedspec::ReferenceNumber do
  before do
    @refn = Gedspec::ReferenceNumber.new <<-END
      1 REFN T13
      2 TYPE TurboGed
    END
  end

  it 'parses refn' do
    @refn.refn.should == 'T13'
  end

  it 'parses type' do
    @refn.type.should == 'TurboGed'
  end
end