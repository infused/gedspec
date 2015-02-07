require 'spec_helper'

describe Gedspec::Individual do
  let(:indi) do
    Gedspec::Individual.new <<-END
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
    expect(indi.name).to eq 'John /Hancock/'
  end

  it 'parses xref' do
    expect(indi.xref).to eq '@I1@'
  end

  it 'parses resn' do
    expect(indi.resn).to eq 'locked'
  end

  it 'parses sex' do
    expect(indi.sex).to eq 'M'
  end

  it 'parses rfn' do
    expect(indi.rfn).to eq 'R55'
  end

  it 'parses afn' do
    expect(indi.afn).to eq 'AFN4'
  end

  it 'parses refn' do
    expect(indi.refn).to eq ['T13', 'L98']
  end

  it 'parses rin' do
    expect(indi.rin).to eq 'A1'
  end

  it 'parses name' do
    expect(indi.name).to eq 'John /Hancock/'
  end
end
