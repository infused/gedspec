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
  
  should 'extract submitter snippet' do
    assert_equal fixture_content('tcg551_sm2.ged'), @gedcom.subm('SM2')
  end
  
  should 'extract indi snippet' do
    assert_equal fixture_content('tcg551_i13.ged'), @gedcom.indi('I13')
  end
  
  should 'extract fam snippet' do
    assert_equal fixture_content('tcg551_f5.ged'), @gedcom.fam('F5')
  end
  
  should 'extract repo snippet' do
    assert_equal fixture_content('tcg551_r1.ged'), @gedcom.repo('R1')
  end
  
  should 'extract sour snippet' do
    assert_equal fixture_content('tcg551_sr2.ged'), @gedcom.sour('SR2')
  end
  
  should 'extract note snippet' do
    assert_equal fixture_content('tcg551_n2.ged'), @gedcom.note('N2')
  end
  
  should 'extact obje snippet' do
    assert_equal fixture_content('tcg551_m1.ged'), @gedcom.obje('M1')
  end
  
end