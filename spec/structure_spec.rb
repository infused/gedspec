require 'spec_helper'

describe Gedspec::Gedcom::Structure do
  let(:structure) { Gedspec::Gedcom::Structure.new }

  describe '#get_level' do
    describe 'when the input string contains a digit character (0123456789)' do
      it 'returns the first digit character as an integer', :shared => true do
        expect(structure.get_level('0 @I1@ INDI')).to eq 0
      end
    end

    describe 'when the input string contains white-space before the digit' do
      it 'returns the first digit character as an integer' do
        expect(structure.get_level(' 0 @I1@ INDI')).to eq 0
      end
    end

    describe 'when the input string does not contain a digit character' do
      it 'should be nil if the the string does not contain a number' do
        expect(structure.get_level('INDI')).to be_nil
      end
    end
  end
end