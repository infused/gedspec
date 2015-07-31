require 'spec_helper'

describe Gedspec::File do
  let(:file) { Gedspec::File.new(fixture_file('/tgc551.ged')) }

  describe '#header' do
    specify { expect(file.header).to be_kind_of(Gedspec::Header) }
  end

  describe '#individuals' do
    specify { expect(file.individuals).to all be_kind_of(Gedspec::Individual) }
  end

  describe '#individual' do
    specify { expect(file.individual('I13')).to be_kind_of(Gedspec::Individual) }
  end

  describe '#families' do
    specify { expect(file.families).to all be_kind_of(Gedspec::Family) }
  end

  describe '#family' do
    specify { expect(file.family('F5')).to be_kind_of(Gedspec::Family) }
  end

  describe '#repositories' do
    specify { expect(file.repositories).to all be_kind_of(Gedspec::Repository) }
  end

  describe '#repository' do
    specify { expect(file.repository('R1')).to be_kind_of(Gedspec::Repository) }
  end
end
