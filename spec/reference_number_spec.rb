require 'spec_helper'

describe Gedspec::ReferenceNumber do
  let(:refn) do
    Gedspec::ReferenceNumber.new <<-END
      1 REFN T13
      2 TYPE TurboGed
    END
  end

  it 'parses refn' do
    expect(refn.refn).to eq 'T13'
  end

  it 'parses type' do
    expect(refn.type).to eq 'TurboGed'
  end
end