require 'spec_helper'

describe Gedspec::PersonalName do
  let(:name) do
    Gedspec::PersonalName.new <<-END
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
    expect(name.name).to eq 'John "Jack" de /Hancock/ Jr.'
  end

  it 'parses npfx' do
    expect(name.npfx).to eq 'Lt.'
  end

  it 'parses givn' do
    expect(name.givn).to eq 'John'
  end

  it 'parses nick' do
    expect(name.nick).to eq 'Jack'
  end

  it 'parses spfx' do
    expect(name.spfx).to eq 'de'
  end

  it 'parses surname' do
    expect(name.surn).to eq 'Hancock'
  end

  it 'parses nsfx' do
    expect(name.nsfx).to eq 'Jr.'
  end
end