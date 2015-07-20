require 'spec_helper'

describe Gedspec::File do
  let(:file) { Gedspec::File.new(fixture_file('/tgc551.ged')) }

  describe '#header' do
    it 'returns an instance of Gedspec::Header' do
      expect(file.header).to be_kind_of(Gedspec::Header)
    end
  end
end
