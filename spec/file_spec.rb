require 'spec_helper'

describe Gedspec::Gedcom::File do
  let(:file) { Gedspec::Gedcom::File.new(fixture_file('/tcg551.ged')) }

  it 'extracts head snippet' do
    expect(file.head).to eq fixture_content('tcg551_head.ged')
  end

  it 'extracts a specific subm snippet' do
    expect(file.subm('SM2')).to eq fixture_content('tcg551_sm2.ged')
  end

  it 'extracts all subm snippets' do
    expect(file.subm.size).to eq 3
    expect(file.subm).to include(fixture_content('tcg551_sm2.ged'))
  end

  it 'extracts a specific indi snippet' do
    expect(file.indi('I13')).to eq fixture_content('tcg551_i13.ged')
  end

  it 'extracts all indi snippets' do
    expect(file.indi.size).to eq 15
    expect(file.indi).to include(fixture_content('tcg551_i13.ged'))
  end

  it 'extracts a specific fam snippet' do
    expect(file.fam('F5')).to eq fixture_content('tcg551_f5.ged')
  end

  it 'extracts all fam snippets' do
    expect(file.fam.size).to eq 7
    expect(file.fam).to include(fixture_content('tcg551_f5.ged'))
  end

  it 'extracts a specific repo snippet' do
    expect(file.repo('R1')).to eq fixture_content('tcg551_r1.ged')
  end

  it 'extracts all repo snippets' do
    expect(file.repo.size).to eq 455
    expect(file.repo).to include(fixture_content('tcg551_r1.ged'))
  end

  it 'extracts a specific sour snippet' do
    expect(file.sour('SR2')).to eq fixture_content('tcg551_sr2.ged')
  end

  it 'extracts all sour snippets' do
    expect(file.sour.size).to eq 2
    expect(file.sour).to include(fixture_content('tcg551_sr2.ged'))
  end

  it 'extracts a specific note snippet' do
    expect(file.note('N2')).to eq fixture_content('tcg551_n2.ged')
  end

  it 'extracts all note snippets' do
    expect(file.note.size).to eq 33
    expect(file.note).to include(fixture_content('tcg551_n2.ged'))
  end

  it 'extracts a specific obje snippet' do
    expect(file.obje('M1')).to eq fixture_content('tcg551_m1.ged')
  end

  it 'extracts all obje snippets' do
    expect(file.obje.size).to eq 745
    expect(file.obje).to include(fixture_content('tcg551_m1.ged'))
  end
end
