require File.join(File.dirname(__FILE__), '..', 'test_helper')

class Gedspec::IndividualTest < Test::Unit::TestCase
  
  should 'load' do
    @indi = Gedspec::Individual.new
    assert_kind_of Gedspec::Individual, @indi
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
    @indi = Gedspec::Individual.new('0 @I1@ INDI')
    @indi.parse
    assert_equal '@I1@', @indi.xref
  end
  
  should 'parse resn' do
    @indi = Gedspec::Individual.parse <<-END
      0 @I1@ INDI
      1 RESN locked
    END
    assert_equal 'locked', @indi.resn
    assert_equal 'locked', @indi.restriction_notice
  end
  
  should 'parse sex' do
    @indi = Gedspec::Individual.parse <<-END
      0 @I1@ INDI
      1 SEX M
    END
    assert_equal 'M', @indi.sex
  end
  
  should 'parse name' do
    @indi = Gedspec::Individual.parse <<-END
      0 @I1@ INDI
      1 NAME John /Hancock/
    END
    assert_equal 'John /Hancock/', @indi.name
  end
  
end