require 'spec_helper'

describe Gedspec::Gedcom::File do
  let(:file) { Gedspec::Gedcom::File.new(fixture_file('/tgc551.ged')) }

  it 'extracts head snippet' do
    expect(file.head).to be_kind_of(Array)
    expect(file.head).to include fixture_content('tgc551_head.ged')
  end

  it 'extracts a specific subm snippet' do
    expect(file.subm('SM2')).to be_kind_of(String)
    expect(file.subm('SM2')).to eq fixture_content('tgc551_sm2.ged')
  end

  it 'extracts all subm snippets' do
    expect(file.subm).to be_kind_of(Array)
    expect(file.subm.size).to eq 3
    expect(file.subm).to include fixture_content('tgc551_sm2.ged')
  end

  it 'extracts a specific indi snippet' do
    expect(file.indi('I13')).to be_kind_of(String)
    expect(file.indi('I13')).to eq fixture_content('tgc551_i13.ged')
  end

  it 'extracts all indi snippets' do
    expect(file.indi.size).to eq 15
    expect(file.indi).to include fixture_content('tgc551_i13.ged')
  end

  it 'extracts a specific fam snippet' do
    expect(file.fam('F5')).to be_kind_of(String)
    expect(file.fam('F5')).to eq fixture_content('tgc551_f5.ged')
  end

  it 'extracts all fam snippets' do
    expect(file.fam).to be_kind_of(Array)
    expect(file.fam.size).to eq 7
    expect(file.fam).to include fixture_content('tgc551_f5.ged')
  end

  it 'extracts a specific repo snippet' do
    expect(file.repo('R1')).to be_kind_of(String)
    expect(file.repo('R1')).to eq fixture_content('tgc551_r1.ged')
  end

  it 'extracts all repo snippets' do
    expect(file.repo).to be_kind_of(Array)
    expect(file.repo).to include fixture_content('tgc551_r1.ged')
  end

  it 'extracts a specific sour snippet' do
    expect(file.sour('SR2')).to be_kind_of(String)
    expect(file.sour('SR2')).to eq fixture_content('tgc551_sr2.ged')
  end

  it 'extracts all sour snippets' do
    expect(file.sour).to be_kind_of(Array)
    expect(file.sour.size).to eq 2
    expect(file.sour).to include fixture_content('tgc551_sr2.ged')
  end

  it 'extracts a specific note snippet' do
    expect(file.note('N2')).to be_kind_of(String)
    expect(file.note('N2')).to eq fixture_content('tgc551_n2.ged')
  end

  it 'extracts all note snippets' do
    expect(file.note).to be_kind_of(Array)
    expect(file.note.size).to eq 33
    expect(file.note).to include fixture_content('tgc551_n2.ged')
  end

  it 'extracts a specific obje snippet' do
    expect(file.obje('M1')).to be_kind_of(String)
    expect(file.obje('M1')).to eq fixture_content('tgc551_m1.ged')
  end

  it 'extracts all obje snippets' do
    expect(file.obje).to be_kind_of(Array)
    expect(file.obje).to include fixture_content('tgc551_m1.ged')
  end
end
