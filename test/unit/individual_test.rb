require File.join(File.dirname(__FILE__), '..', 'test_helper')

class Gedspec::IndividualTest < Test::Unit::TestCase
  def setup
    @indi = Gedspec::Individual.parse <<-END
      0 @I1@ INDI
      1 RESN locked
      1 SEX M
      1 RFN R55
      1 AFN AFN4
      1 REFN T13
      1 REFN L98
      1 RIN A1
    END
  end
  
  should 'have many names' do
    @indi = Gedspec::Individual.new
    assert_kind_of Array, @indi.names
  end
  
  should 'have a primary name' do
    @indi = Gedspec::Individual.new
    assert_equal @indi.names.first, @indi.name
  end
  
  should 'parse xref' do
    assert_equal '@I1@', @indi.xref
  end
  
  should 'parse resn' do
    assert_equal 'locked', @indi.resn
    assert_equal 'locked', @indi.restriction_notice
  end
  
  should 'parse sex' do
    assert_equal 'M', @indi.sex
  end
  
  should 'parse rfn' do
    assert_equal 'R55', @indi.rfn
  end
  
  should 'parse afn' do
    assert_equal 'AFN4', @indi.afn
  end
  
  should 'have a primary refn' do
    assert_equal 'T13', @indi.refn 
  end
  
  should "have multiple refn's" do
    assert_equal %w(T13 L98), @indi.refns
  end
  
  should 'parse rin' do
    assert_equal 'A1', @indi.rin
  end
  
  should 'parse name' do
    @indi = Gedspec::Individual.parse <<-END
      0 @I1@ INDI
      1 NAME John /Hancock/
    END
    assert_equal 'John /Hancock/', @indi.name
  end
  
end