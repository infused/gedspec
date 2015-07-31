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
    describe 'with valid xref' do
      specify { expect(file.individual('I13')).to be_kind_of(Gedspec::Individual) }
    end

    describe 'with invalid xref' do
      specify { expect(file.individual('XX')).to be_nil }
    end
  end

  describe '#families' do
    specify { expect(file.families).to all be_kind_of(Gedspec::Family) }
  end

  describe '#family' do
    describe 'with valid xref' do
      specify { expect(file.family('F5')).to be_kind_of(Gedspec::Family) }
    end

    describe 'with invalid xref' do
      specify { expect(file.family('XX')).to be_nil }
    end
  end

  describe '#repositories' do
    specify { expect(file.repositories).to all be_kind_of(Gedspec::Repository) }
  end

  describe '#repository' do
    describe 'with valid xref' do
      specify { expect(file.repository('R1')).to be_kind_of(Gedspec::Repository) }
    end

    describe 'with invalid xref' do
      specify { expect(file.repository('XX')).to be_nil }
    end
  end

  describe '#sources' do
    specify { expect(file.sources).to all be_kind_of(Gedspec::Source) }
  end

  describe '#source' do
    describe 'with valid xref' do
      specify { expect(file.source('SR2')).to be_kind_of(Gedspec::Source) }
    end

    describe 'with invalid xref' do
      specify { expect(file.source('XX')).to be_nil }
    end
  end

  describe '#notes' do
    specify { expect(file.notes).to all be_kind_of(Gedspec::Note) }
  end

  describe '#note' do
    describe 'with valid xref' do
      specify { expect(file.note('N2')).to be_kind_of(Gedspec::Note) }
    end

    describe 'with invalid xref' do
      specify { expect(file.note('XX')).to be_nil }
    end
  end

  describe '#objects' do
    specify { expect(file.objects).to all be_kind_of(Gedspec::MediaObject) }
  end

  describe '#object' do
    describe 'with valid xref' do
      specify { expect(file.object('M1')).to be_kind_of(Gedspec::MediaObject) }
    end

    describe 'with invalid xref' do
      specify { expect(file.object('XX')).to be_nil }
    end
  end
end
