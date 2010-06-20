require 'test_helper'

class Gedspec::Gedcom::FileTest < Test::Unit::TestCase
  
  def setup
    @gedcom = Gedspec::Gedcom::File.new(fixture_file('/tcg551.ged'))
  end
  
  should 'load' do
    assert_kind_of Gedspec::Gedcom::File, @gedcom
  end
  
  should 'extract head snippet' do
    assert_equal fixture_content('tcg551_head.ged'), @gedcom.head
  end
  
  should 'extract a specific subm snippet' do
    assert_equal fixture_content('tcg551_sm2.ged'), @gedcom.subm('SM2')
  end
  
  should 'extract all subm snippets' do
    assert_equal 3, @gedcom.subm.size
    assert @gedcom.subm.include?(fixture_content('tcg551_sm2.ged'))
  end
  
  should 'extract a specific indi snippet' do
    assert_equal fixture_content('tcg551_i13.ged'), @gedcom.indi('I13')
  end
  
  should 'extract all indi snippets' do
    assert_equal 15, @gedcom.indi.size
    assert @gedcom.indi.include?(fixture_content('tcg551_i13.ged'))
  end
  
  should 'extract a specific fam snippet' do
    assert_equal fixture_content('tcg551_f5.ged'), @gedcom.fam('F5')
  end
  
  should 'extract all fam snippets' do
    assert_equal 7, @gedcom.fam.size
    assert @gedcom.fam.include?(fixture_content('tcg551_f5.ged'))
  end
  
  should 'extract a specific repo snippet' do
    assert_equal fixture_content('tcg551_r1.ged'), @gedcom.repo('R1')
  end
  
  should 'extract all repo snippets' do
    assert_equal 455, @gedcom.repo.size
    assert @gedcom.repo.include?(fixture_content('tcg551_r1.ged'))
  end
  
  should 'extract a specific sour snippet' do
    assert_equal fixture_content('tcg551_sr2.ged'), @gedcom.sour('SR2')
  end
  
  should 'extract all sour snippets' do
    assert_equal 2, @gedcom.sour.size
    assert @gedcom.sour.include?(fixture_content('tcg551_sr2.ged'))
  end
  
  should 'extract a specific note snippet' do
    assert_equal fixture_content('tcg551_n2.ged'), @gedcom.note('N2')
  end
  
  should 'extract all note snippets' do
    assert_equal 33, @gedcom.note.size
    assert @gedcom.note.include?(fixture_content('tcg551_n2.ged'))
  end
  
  should 'extract a specific obje snippet' do
    assert_equal fixture_content('tcg551_m1.ged'), @gedcom.obje('M1')
  end
  
  should 'extract all obje snippets' do
    assert_equal 745, @gedcom.obje.size
    assert @gedcom.obje.include?(fixture_content('tcg551_m1.ged'))
  end
  
end