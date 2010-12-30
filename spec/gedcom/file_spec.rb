require 'spec_helper'

describe Gedspec::Gedcom::File do
  before do
    @gedcom = Gedspec::Gedcom::File.new(fixture_file('/tcg551.ged'))
  end
  
  it 'extracts head snippet' do
    @gedcom.head.should == fixture_content('tcg551_head.ged')
  end
  
  it 'extracts a specific subm snippet' do
    @gedcom.subm('SM2').should == fixture_content('tcg551_sm2.ged')
  end
  
  it 'extracts all subm snippets' do
    @gedcom.subm.size.should == 3
    @gedcom.subm.should include(fixture_content('tcg551_sm2.ged'))
  end
  
  it 'extracts a specific indi snippet' do
    @gedcom.indi('I13').should == fixture_content('tcg551_i13.ged')
  end
  
  it 'extracts all indi snippets' do
    @gedcom.indi.size.should == 15
    @gedcom.indi.should include(fixture_content('tcg551_i13.ged'))
  end
  
  it 'extracts a specific fam snippet' do
    @gedcom.fam('F5').should == fixture_content('tcg551_f5.ged')
  end
  
  it 'extracts all fam snippets' do
    @gedcom.fam.size.should == 7
    @gedcom.fam.should include(fixture_content('tcg551_f5.ged'))
  end
  
  it 'extracts a specific repo snippet' do
    @gedcom.repo('R1').should == fixture_content('tcg551_r1.ged')
  end
  
  it 'extracts all repo snippets' do
    @gedcom.repo.size.should == 455
    @gedcom.repo.should include(fixture_content('tcg551_r1.ged'))
  end
  
  it 'extracts a specific sour snippet' do
    @gedcom.sour('SR2').should == fixture_content('tcg551_sr2.ged')
  end
  
  it 'extracts all sour snippets' do
    @gedcom.sour.size.should == 2
    @gedcom.sour.should include(fixture_content('tcg551_sr2.ged'))
  end
  
  it 'extracts a specific note snippet' do
    @gedcom.note('N2').should == fixture_content('tcg551_n2.ged')
  end
  
  it 'extracts all note snippets' do
    @gedcom.note.size.should == 33
    @gedcom.note.should include(fixture_content('tcg551_n2.ged'))
  end
  
  it 'extracts a specific obje snippet' do
    @gedcom.obje('M1').should == fixture_content('tcg551_m1.ged')
  end
  
  it 'extracts all obje snippets' do
    @gedcom.obje.size.should == 745
    @gedcom.obje.should include(fixture_content('tcg551_m1.ged'))
  end
end