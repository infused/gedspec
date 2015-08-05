require 'spec_helper'

describe Gedspec::Note do
  let(:file) { Gedspec::File.new(fixture_file('/tgc551.ged')) }
  let(:note) { file.note('N18') }

  specify { expect(note).to be_kind_of(Gedspec::Note) }
  specify { expect(note.id).to eq 'N18' }

  it 'parses refn' do
    expect(note.refn).to eq 'User Reference Number'
  end
end
